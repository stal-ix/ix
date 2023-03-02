#include <stdlib.h>
#include <stdint.h>
#include <errno.h>

static inline bool size_multiply_overflow(size_t size, size_t need) {
    return need != 0 && size > (SIZE_MAX / need);
}

extern "C" void* reallocarray(void* p, size_t need, size_t size) {
    if (size_multiply_overflow(size, need)) {
        errno = ENOMEM;

        return NULL;
    }

    return realloc(p, size * need);
}
