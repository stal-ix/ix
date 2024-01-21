#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <dirent.h>

#undef open64

int open64(const char* pathname, int flags, mode_t mode) {
    return open(pathname, flags, mode);
}

#undef stat64

int stat64(const char* fname, struct stat* buf) {
    return stat(fname, buf);
}

#undef lstat64

int lstat64(const char* fname, struct stat* buf) {
    return lstat(fname, buf);
}

#undef fstat64

int fstat64(int fd, struct stat* buf) {
    return fstat(fd, buf);
}

#undef pread64

ssize_t pread64(int fd, void* buf, size_t count, off_t offset) {
    return pread(fd, buf, count, offset);
}

#undef ftruncate64

int ftruncate64(int fd, off_t length) {
    return ftruncate(fd, length);
}

#undef lseek64

off_t lseek64(int fd, off_t offset, int whence) {
    return lseek(fd, offset, whence);
}

#undef readdir64_r

int readdir64_r(DIR* dirp, struct dirent* entry, struct dirent** result) {
    return readdir_r(dirp, entry, result);
}
