#pragma once

#include_next <stdlib.h>

#if defined(__cplusplus)
extern "C" {
#endif

void* reallocarray(void* ptr, size_t nmemb, size_t size);

#if defined(__cplusplus)
}
#endif
