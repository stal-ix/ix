{% extends '//die/c/make.sh' %}

{% set version %}22.3{% endset %}

{% block fetch %}
https://github.com/openSUSE/hwinfo/archive/refs/tags/{{version}}.tar.gz
sha:4ce5a852a9c58d70f59108382448097ffc4783ff336978ae49ec870ce02e99db
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
