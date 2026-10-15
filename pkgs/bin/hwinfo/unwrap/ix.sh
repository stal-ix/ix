{% extends '//die/c/make.sh' %}

{% block version %}
26.0
{% endblock %}

{% block pkg_name %}
hwinfo
{% endblock %}

{% block fetch %}
https://github.com/openSUSE/hwinfo/archive/refs/tags/{{self.version().strip()}}.tar.gz
7774b23bc271a15b8db8f90b7c92ab0409c781a794163c0eb372c96a9c7fc293
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
