typedef unsigned long size_t;

double buf[1000000];
char* cur = (char*)&buf;

static void* alloc(size_t len, size_t align) {
    if (len < (size_t)1) {
        len = (size_t)1;
    }

    while (((size_t)cur) % align) {
        ++cur;
    }

    return (cur += len) - len;
}

void* malloc(size_t len) {
    return alloc(len, 32);
}

void* realloc(char* ptr, size_t len) {
    if (!ptr) {
        return malloc(len);
    }

    if (!len) {
        return 0;
    }

    char* ret = malloc(len);

    for (size_t i = 0; i < len; ++i) {
        ret[i] = ptr[i];
    }

    return ret;
}

void free(void* ptr) {
}

void* calloc(size_t nmemb, size_t size) {
    size_t n = nmemb * size;
    char* ret = malloc(n);

    for (size_t i = 0; i < n; ++i) {
        ret[i] = 0;
    }

    return ret;
}

int posix_memalign(void** memptr, size_t alignment, size_t size) {
    *memptr = alloc(size, alignment);

    return 0;
}

void* memalign(size_t boundary, size_t size) {
    return alloc(size, boundary);
}
