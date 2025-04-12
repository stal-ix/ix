{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.41
{% endblock %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:277407acf21815006eb4bb2ee9c2fa2ea6f4f84bfc57486c460c6bc8c77a4445
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
bld/shebangs
{% endblock %}

{% block autoreconf %}
export LT_OPTS=-ci
{{super()}}
{% endblock %}

{% block c_rename_symbol %}
parse_range
{% endblock %}

{% block patch %}
fix_shebangs ./tools/all_syscalls
fix_shebangs ./tools/all_errnos
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
