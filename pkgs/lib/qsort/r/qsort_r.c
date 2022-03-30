#include "qsort_r.h"

#include <stdlib.h>

static __thread void* A;
static __thread int (*F)(const void*, const void*, void*);

static inline int C(const void* l, const void* r) {
    return F(l, r, A);
}

void qsort_r(void* base, size_t nmemb, size_t size, int (*compar)(const void*, const void*, void*), void *arg) {
    F = compar;
    A = arg;

    qsort(base, nmemb, size, C);
}
