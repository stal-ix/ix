#include <dlfcn.h>

void* glXGetProcAddressARB(const char* name) {
    return dlsym(dlopen("GL", RTLD_GLOBAL), name);
}
