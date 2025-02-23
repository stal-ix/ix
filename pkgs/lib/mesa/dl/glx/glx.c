#include <dlfcn.h>

void* mesa_glesv2_glXGetProcAddressARB(const char* name) {
    return dlsym(dlopen("GL", RTLD_GLOBAL), name);
}
