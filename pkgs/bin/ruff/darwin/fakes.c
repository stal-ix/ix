#include <stdlib.h>

void* je_rallocx(void *ptr, size_t size, int flags);

void* rallocx(void* ptr, size_t size, int flags) {
    return je_rallocx(ptr, size, flags);
}

void je_sdallocx(void* ptr, size_t size, int flags);

void sdallocx(void* ptr, size_t size, int flags) {
    je_sdallocx(ptr, size, flags);
}

void* je_mallocx(size_t size, int flags);

void* mallocx(size_t size, int flags) {
    return je_mallocx(size, flags);
}
