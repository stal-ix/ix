{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://sourceware.org/elfutils/ftp/0.191/elfutils-0.191.tar.bz2
sha:df76db71366d1d708365fc7a6c60ca48398f14367eb2b8954efc8897147ad871
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/fts
lib/zstd
lib/bzip/2
lib/shim/gnu/basename
{% endblock %}

{% block bld_libs %}
{% if aarch64 %}
lib/kernel
{% endif %}
lib/obstack
lib/argp/standalone
lib/shim/gnu/basename/overlay
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
bld/m4
bld/gettext
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

{% block make_flags %}
READELF=true
{% endblock %}
