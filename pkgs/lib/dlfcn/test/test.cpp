#include "dlfcn.h"

#include <cstring>
#include <cstdlib>
#include <iostream>
#include <stdexcept>

static inline void abortMe(const char* err) {
    std::cerr << err << std::endl;
    abort();
}

int main() {
    auto s = dlsym(RTLD_DEFAULT, "dlerror");

    if (!s) {
        abortMe("no dlerror sym");
    }

    if (auto err = ((char* (*)())(s))(); err) {
        abortMe(err);
    }

    if (auto res = dlsym(RTLD_DEFAULT, "noname"); res) {
        abortMe("found nonexistent symbol");
    }

    if (auto err = ((char* (*)())(s))(); err) {
        if (strcmp(err, "symbol not found") != 0) {
            abortMe("bad symbol name");
        }
    } else {
        abortMe("no expected error");
    }

    auto h = dlopen("/lib/libc.so", RTLD_LOCAL);

    if (!h) {
        abortMe("bad so");
    }
}
