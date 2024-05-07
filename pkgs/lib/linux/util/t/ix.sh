{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v2.40.1.tar.gz
sha:61f815bbfaabad7a6a56af6cb5c5bc7e2d26ae764b1e59901fd809ac3fd55f68
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
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
