{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.39.1.tar.gz
sha:d8db91a48ba96f11a981a39e75e395af9aad7d65e08a8601680abfdd3af5c2bd
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
bld/bison
bld/gettext
{% endblock %}

{% block autoreconf %}
export LT_OPTS=-ci
{{super()}}
{% endblock %}

{% block patch %}
cat - libmount/src/hook_mount.c << EOF > _
#pragma once
#define statx musl_statx
#define statx_timestamp musl_statx_timestamp
#include <sys/stat.h>
#undef statx
#undef statx_timestamp
#include <linux/stat.h>
int statx(int, const char*, int, unsigned, struct statx*);
EOF
mv _ libmount/src/hook_mount.c
{% endblock %}
