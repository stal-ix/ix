/*
 * The MIME module: libmagic behind two exports, for a host that keeps one
 * instance per worker and gives it whole files.
 *
 *     magic_mime(data, len) -> type | 0
 *     magic_mime_error() -> cause | 0
 *
 * The host puts the bytes into linear memory through the exported malloc.
 * The type is a C string in linear memory, the library's own, valid until
 * the next call. The compiled magic database is built into the module and
 * loaded on the first call of an instance. A trap in any call leaves the
 * instance dead, as any wasm instance; 0 is a failure the library noticed
 * itself, and magic_mime_error says what it was.
 */
#include <magic.h>
#include <stddef.h>
#include <stdint.h>

extern unsigned char magic_mgc[];
extern unsigned int magic_mgc_len;

void __wasm_call_ctors(void);

static magic_t cookie;
static int loaded;
static const char *failure;

/* the library with its database, once per instance */
static magic_t prepare(void) {
    static int up;

    if (!up) {
        __wasm_call_ctors();
        up = 1;
    }

    if (cookie == NULL) {
        cookie = magic_open(MAGIC_MIME_TYPE | MAGIC_ERROR);

        if (cookie == NULL) {
            failure = "magic_open failed";
            return NULL;
        }
    }

    if (!loaded) {
        void *buffers[1] = {magic_mgc};
        size_t sizes[1] = {magic_mgc_len};

        if (magic_load_buffers(cookie, buffers, sizes, 1) != 0) {
            failure = magic_error(cookie);
            return NULL;
        }

        loaded = 1;
    }

    return cookie;
}

__attribute__((export_name("magic_mime")))
const char *magic_mime(const void *data, uint32_t len) {
    magic_t ms = prepare();

    if (ms == NULL) {
        return NULL;
    }

    const char *type = magic_buffer(ms, data, len);

    failure = type == NULL ? magic_error(ms) : NULL;
    return type;
}

__attribute__((export_name("magic_mime_error")))
const char *magic_mime_error(void) {
    return failure;
}
