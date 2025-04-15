{% extends '//die/c/make.sh' %}

{% block version %}
23.4
{% endblock %}

{% block pkg_name %}
hwinfo
{% endblock %}

{% block fetch %}
https://github.com/openSUSE/hwinfo/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:375ee9affbfbcf61a897cfe5ef3698cf32674a3c66fca6ce108d97f5c30c7416
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
