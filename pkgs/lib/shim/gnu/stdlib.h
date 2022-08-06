#pragma once

#include_next <stdlib.h>

#if defined(__cplusplus)
extern "C" {
#endif

char* canonicalize_file_name(const char* path);

#if defined(__cplusplus)
}
#endif
