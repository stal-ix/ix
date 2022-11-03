{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://sourceware.org/elfutils/ftp/0.188/elfutils-0.188.tar.bz2
sha:fb8b0e8d0802005b9a309c60c1d8de32dd2951b56f0c3a3cb56d21ce01595dff
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
