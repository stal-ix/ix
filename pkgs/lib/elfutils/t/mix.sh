{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://sourceware.org/elfutils/ftp/0.186/elfutils-0.186.tar.bz2
2c095e31e35d6be7b3718477b6d52702
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/fts
lib/zstd
lib/bzip2
lib/obstack
{% endblock %}

{% block bld_libs %}
lib/gnushim
lib/argp/standalone
{% endblock %}

{% block bld_tool %}
bin/m4
bin/gettext
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
