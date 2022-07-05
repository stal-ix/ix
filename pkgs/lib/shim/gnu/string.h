#pragma once

#include <libgen.h>
#include_next <string.h>

#if defined(__cplusplus)
static inline char* basename(const char* s) {
    return ::basename((char*)s);
}
#endif
