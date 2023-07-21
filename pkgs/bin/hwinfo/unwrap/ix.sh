{% extends '//die/c/make.sh' %}

{% set version %}23.2{% endset %}

{% block fetch %}
https://github.com/openSUSE/hwinfo/archive/refs/tags/{{version}}.tar.gz
sha:1ffc00d07aa1ad766e861d0d8492e2d2fa52cf537807f34e1c80e8c2d56c7115
{% endblock %}

{% block bld_libs %}
lib/c
lib/sysfs
lib/kernel
lib/x86/emu
lib/linux/util
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bison
bin/systool
bld/flex/lex
{% endblock %}

{% block patch %}
rm git2log
echo '{{version}}' > VERSION
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block make_flags %}
DESTDIR=${out}/
HWINFO_VERSION={{version}}
{% endblock %}

{% block make_target %}
static
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/* ./
mv lib64 lib
mv sbin bin
rm -rf usr
{% endblock %}
