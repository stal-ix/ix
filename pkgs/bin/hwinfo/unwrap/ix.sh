{% extends '//die/c/make.sh' %}

{% set version %}23.3{% endset %}

{% block fetch %}
https://github.com/openSUSE/hwinfo/archive/refs/tags/{{version}}.tar.gz
sha:ee7f1cb15bde7d6d40cc5f70e382dbaa8264a12f0b1692eba23f14ea146c0e0d
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
>src/version.h
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

{% block build %}
make -C src/hd version.h
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/* ./
mv lib64 lib
mv sbin bin
rm -rf usr
{% endblock %}
