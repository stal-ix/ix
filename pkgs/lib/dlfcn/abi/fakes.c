#define COMPILE_DLOPEN
#include <dlfcn.h>

#define MUSL_RTLD_NEXT    ((void *)-1)
#define MUSL_RTLD_DEFAULT ((void *)0)

char* dlerror() {
    return stub_dlerror();
}

void* dlopen(const char* lib, int mode) {
    return stub_dlopen(lib, 0);
}

void* dlsym(void* handle, const char* sym) {
    if (handle == MUSL_RTLD_NEXT) {
        handle = RTLD_NEXT;
    } else if (handle == MUSL_RTLD_DEFAULT) {
        handle = RTLD_DEFAULT;
    }

    return stub_dlsym(handle, sym);
}

int dlclose(void* lib) {
    return 0;
}

int dladdr(const void* addr, void* info) {
    return 0;
}
