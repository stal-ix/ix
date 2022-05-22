#pragma once

#include <stddef.h>

#if defined(__cplusplus)
extern "C" {
#endif

#define qsort_r ix_qsort_r
void qsort_r(void* base, size_t nmemb, size_t size, int (*compar)(const void*, const void*, void*), void* arg);

#if defined(__cplusplus)
}
#endif
