/*
 * Runtime side of the Wine tree embedded into the wine executable,
 * see include/wine/embed.h in the patched Wine sources.
 *
 * The payload (payload.S, generated) is a table of zstd frames placed in
 * its own read-only segment; files are served as memfds holding the
 * decompressed contents, lookups are ASCII case-insensitive like Wine's
 * own file name lookup.
 */

#define _GNU_SOURCE

#include <errno.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <time.h>
#include <unistd.h>

#include <zstd.h>

#define ROOT "/@wine"

struct embed_file
{
    const char          *name;   /* relative to ROOT */
    const unsigned char *data;   /* one zstd frame */
    unsigned long        csize;
    unsigned long        size;
};

extern const struct embed_file wine_embed_files[];
extern const unsigned long wine_embed_count;
extern const unsigned long wine_embed_mtime;

static const struct embed_file **files;
static pthread_once_t files_once = PTHREAD_ONCE_INIT;

static int compare_files( const void *a, const void *b )
{
    return strcasecmp( (*(const struct embed_file *const *)a)->name,
                       (*(const struct embed_file *const *)b)->name );
}

static void init_files( void )
{
    unsigned long i;

    if (!(files = malloc( wine_embed_count * sizeof(*files) ))) abort();
    for (i = 0; i < wine_embed_count; i++) files[i] = &wine_embed_files[i];
    qsort( files, wine_embed_count, sizeof(*files), compare_files );
}

/* first entry not below key */
static unsigned long lower_bound( const char *key )
{
    unsigned long lo = 0, hi = wine_embed_count, mid;

    while (lo < hi)
    {
        mid = lo + (hi - lo) / 2;
        if (strcasecmp( files[mid]->name, key ) < 0) lo = mid + 1;
        else hi = mid;
    }
    return lo;
}

/* copy the path relative to ROOT into key, without trailing slashes; -1 if outside */
static int relative_key( const char *path, char *key, size_t size )
{
    size_t len = sizeof(ROOT) - 1;

    if (strncmp( path, ROOT, len ) || (path[len] && path[len] != '/')) return -1;
    path += len;
    while (*path == '/') path++;
    len = strlen( path );
    while (len && path[len - 1] == '/') len--;
    if (len + 2 > size) return -1;
    memcpy( key, path, len );
    key[len] = 0;
    return len;
}

static int prefix_match( unsigned long i, const char *prefix, size_t len )
{
    return i < wine_embed_count && !strncasecmp( files[i]->name, prefix, len );
}

/* the file at path; NULL with *is_dir set for directories, NULL alone if absent */
static const struct embed_file *lookup( const char *path, int *is_dir )
{
    char key[4096];
    unsigned long i;
    int len;

    *is_dir = 0;
    pthread_once( &files_once, init_files );
    if ((len = relative_key( path, key, sizeof(key) )) < 0) return NULL;
    if (!len)
    {
        *is_dir = 1;
        return NULL;
    }
    i = lower_bound( key );
    if (i < wine_embed_count && !strcasecmp( files[i]->name, key )) return files[i];
    key[len++] = '/';
    key[len] = 0;
    *is_dir = prefix_match( lower_bound( key ), key, len );
    return NULL;
}

static unsigned long hash_name( const char *name )
{
    unsigned long hash = 14695981039346656037ul;

    while (*name) hash = (hash ^ (unsigned char)(*name++ | 0x20)) * 1099511628211ul;
    return hash;
}

int wine_embed_stat( const char *path, struct stat *st )
{
    const struct embed_file *file;
    int is_dir;

    if (!(file = lookup( path, &is_dir )) && !is_dir)
    {
        errno = ENOENT;
        return -1;
    }
    memset( st, 0, sizeof(*st) );
    st->st_dev = makedev( 0xfff, 0xfff );
    st->st_nlink = 1;
    st->st_uid = getuid();
    st->st_gid = getgid();
    st->st_blksize = 4096;
    st->st_atime = st->st_mtime = st->st_ctime = wine_embed_mtime;
    if (file)
    {
        st->st_ino = file - wine_embed_files + 1;
        st->st_mode = S_IFREG | 0444;
        st->st_size = file->size;
        st->st_blocks = (file->size + 511) / 512;
    }
    else
    {
        st->st_ino = hash_name( path ) | (1ul << 63);
        st->st_mode = S_IFDIR | 0555;
        st->st_size = 4096;
    }
    return 0;
}

int wine_embed_open( const char *path )
{
    const struct embed_file *file;
    struct timespec times[2];
    const char *name;
    void *map;
    size_t ret;
    int fd, err, is_dir;

    if (!(file = lookup( path, &is_dir )))
    {
        errno = is_dir ? EISDIR : ENOENT;
        return -1;
    }
    name = strrchr( file->name, '/' ) ? strrchr( file->name, '/' ) + 1 : file->name;
    if ((fd = memfd_create( name, MFD_CLOEXEC )) == -1) return -1;
    if (file->size)
    {
        if (ftruncate( fd, file->size ) == -1) goto failed;
        map = mmap( NULL, file->size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0 );
        if (map == MAP_FAILED) goto failed;
        ret = ZSTD_decompress( map, file->size, file->data, file->csize );
        munmap( map, file->size );
        if (ZSTD_isError( ret ) || ret != file->size)
        {
            errno = EIO;
            goto failed;
        }
    }
    /* stable times: wineboot compares the one of wine.inf to decide on a prefix update */
    times[0].tv_sec = times[1].tv_sec = wine_embed_mtime;
    times[0].tv_nsec = times[1].tv_nsec = 0;
    futimens( fd, times );
    return fd;

failed:
    err = errno;
    close( fd );
    errno = err;
    return -1;
}

int wine_embed_readdir( const char *path, unsigned int *cookie, char *name, size_t size )
{
    const char *entry, *end;
    char key[4096];
    unsigned long i;
    size_t len;
    int ret;

    pthread_once( &files_once, init_files );
    if ((ret = relative_key( path, key, sizeof(key) )) < 0) return 0;
    len = ret;
    if (len) key[len++] = '/';
    key[len] = 0;

    i = *cookie ? *cookie - 1 : lower_bound( key );
    if (!prefix_match( i, key, len )) return 0;

    entry = files[i]->name + len;
    end = strchr( entry, '/' );
    ret = end ? end - entry : strlen( entry );
    if (ret + 1 > size) return 0;
    memcpy( name, entry, ret );
    name[ret] = 0;

    /* a subdirectory shows up once, skip the rest of its files */
    while (++i < wine_embed_count && prefix_match( i, key, len ) &&
           !strncasecmp( files[i]->name + len, name, ret ) && files[i]->name[len + ret] == '/')
        ;
    *cookie = i + 1;
    return 1;
}
