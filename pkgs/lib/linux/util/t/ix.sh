{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
util-linux
{% endblock %}

{% block version %}
2.42.4
{% endblock %}

{% block fetch %}
https://github.com/util-linux/util-linux/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e1d38037dab761a2d39114d88a6744ffd5a4576efa29fe41e1dfbd8453891fe7
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
sed -i '/#include "all-io.h"/a#include "fileutils.h"' libmount/src/hook_idmap.c
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
