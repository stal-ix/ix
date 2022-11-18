{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.76.tar.gz
sha:d3955420752a5e7112e029a0a29cd0d8b434ba57527dfb0617913179d10efb20
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/md
lib/event
lib/curses
lib/openssl
lib/linux/util
lib/bsd/overlay
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block patch %}
>compat/getprogname.c

cat << EOF > xxx.h
#pragma once

#include <stddef.h>
#include <stdint.h>
#include <limits.h>

#define __scanflike(X, Y)

void arc4random_buf(void*, size_t);
uint32_t arc4random();
void arc4random_stir();
void arc4random_addrandom(unsigned char*, int);
void setproctitle(const char*, ...);
const char* getprogname();
void closefrom(int);
void* reallocarray(void*, size_t, size_t);
void* recallocarray(void* ptr, size_t, size_t, size_t);
void freezero(void*, size_t);
long long strtonum(const char*, long long, long long, const char**);
int mergesort(void*, size_t, size_t, int (*)(const void*, const void*));
EOF
{% endblock %}

{% block setup %}
export CPPFLAGS="-include ${PWD}/xxx.h ${CPPFLAGS}"
{% endblock %}
