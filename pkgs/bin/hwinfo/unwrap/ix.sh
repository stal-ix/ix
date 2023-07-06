{% extends '//die/c/make.sh' %}

{% set version %}23.1{% endset %}

{% block fetch %}
https://github.com/openSUSE/hwinfo/archive/refs/tags/{{version}}.tar.gz
sha:cd1bd007a43469ccea651eca8dfe7cb3ec502bce6058b90db48b1e3cae6c9903
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
