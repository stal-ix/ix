{% extends '//die/c/make.sh' %}

{% block version %}
25.5
{% endblock %}

{% block pkg_name %}
hwinfo
{% endblock %}

{% block fetch %}
https://github.com/openSUSE/hwinfo/archive/refs/tags/{{self.version().strip()}}.tar.gz
570c8e6cfe70260284bcaad7d63b42a401384bc2d15987cc6411ea7ee1b45c8e
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
echo '{{self.version().strip()}}' > VERSION
>src/version.h
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block make_flags %}
DESTDIR=${out}/
HWINFO_VERSION={{self.version().strip()}}
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
