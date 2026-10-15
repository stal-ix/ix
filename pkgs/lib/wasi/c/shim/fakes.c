void abort();

void __cxa_allocate_exception() {
    abort();
}

void __cxa_throw() {
    abort();
}

int __cxa_atexit(void (*)(void*), void*, void*);

// single-threaded wasm: thread_local destructors run at exit
int __cxa_thread_atexit(void (*dtor)(void*), void* obj, void* dso) {
    return __cxa_atexit(dtor, obj, dso);
}

typedef __SIZE_TYPE__ size_t;

void* malloc(size_t);
void free(void*);
void* calloc(size_t, size_t);

// musl internals reach the allocator through these names; dlmalloc used
// to define them, lib/c/alloc provides only the public ones
void* __libc_malloc(size_t n) {
    return malloc(n);
}

void __libc_free(void* p) {
    free(p);
}

void* __libc_calloc(size_t n, size_t m) {
    return calloc(n, m);
}
