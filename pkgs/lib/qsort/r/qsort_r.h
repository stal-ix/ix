#pragma once

#include <stddef.h>

#define qsort_r mix_qsort_r
void qsort_r(void* base, size_t nmemb, size_t size, int (*compar)(const void*, const void*, void*), void* arg);
