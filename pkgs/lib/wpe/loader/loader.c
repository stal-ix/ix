#include "loader-private.h"

#include <stdio.h>
#include <stdlib.h>

extern struct wpe_loader_interface _wpe_loader_interface;

bool wpe_loader_init(const char* unused) {
    return true;
}

const char* wpe_loader_get_loaded_implementation_library_name(void) {
    return "fdo";
}

void* wpe_load_object(const char* object_name) {
    return _wpe_loader_interface.load_object(object_name);
}
