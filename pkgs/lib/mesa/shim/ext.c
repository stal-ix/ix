#include <dlfcn.h>

typedef void** (func_t)(const char*);

void** dri_loader_get_extensions(const char* name) {
    func_t* f = (func_t*)dlsym(RTLD_NEXT, "dri_loader_get_extensions");

    if (!f) {
        return 0;
    }

    return f(name);
}
