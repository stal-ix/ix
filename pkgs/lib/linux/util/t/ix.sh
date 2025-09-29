{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
util-linux
{% endblock %}

{% block version %}
2.41.2
{% endblock %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v{{self.version().strip()}}.tar.gz
534aa113a323d6866c5f46baf909618dcc60c391ad24a91814e5d21511cefd30
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
