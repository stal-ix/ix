{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://sourceware.org/elfutils/ftp/0.187/elfutils-0.187.tar.bz2
sha:e70b0dfbe610f90c4d1fe0d71af142a4e25c3c4ef9ebab8d2d72b65159d454c8
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/fts
lib/zstd
lib/bzip/2
{% endblock %}

{% block bld_libs %}
lib/obstack
lib/shim/gnu
lib/argp/standalone
{% endblock %}

{% block bld_tool %}
bld/m4
bld/gettext
{% endblock %}

{% block patch %}
mkdir sys; echo > sys/cdefs.h
{% endblock %}

{% block patch_configure %}
sed -e 's|"-shared"|""|' -i configure
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block cpp_defines %}
FNM_EXTMATCH=0
{% endblock %}

{% block c_rename_symbol %}
crc32
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}
