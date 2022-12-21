{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.79.tar.gz
sha:78be1c0a905184ed1cb506468359faf87e4ee86851291b1670439c46bfb3d87c
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/md
lib/bsd
lib/event
lib/curses
lib/openssl
lib/linux/util
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
#include <stdio.h>

#define __scanflike(X, Y)

int fpurge(FILE* stream);
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

{% block cpp_missing %}
${PWD}/xxx.h
{% endblock %}
