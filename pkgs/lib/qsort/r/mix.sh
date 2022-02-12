{% extends '//mix/c_std.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build %}
cat << EOF > qsort_r.c
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
EOF

cc -c qsort_r.c -o qsort_r.o
ar q libqsort_r.a qsort_r.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libqsort_r.a ${out}/lib/

mkdir ${out}/include
cat << EOF > ${out}/include/qsort_r.h
#pragma once
void qsort_r(void* base, size_t nmemb, size_t size, int (*compar)(const void*, const void*, void*), void* arg);
EOF
{% endblock %}
