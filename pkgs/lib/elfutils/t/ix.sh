{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://sourceware.org/elfutils/ftp/0.189/elfutils-0.189.tar.bz2
sha:39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8
#http://sourceware.org/elfutils/ftp/0.190/elfutils-0.190.tar.bz2
#sha:8e00a3a9b5f04bc1dc273ae86281d2d26ed412020b391ffcc23198f10231d692
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
{% if aarch64 %}
lib/kernel
{% endif %}
lib/shim/fake(lib_name=stdc++)
lib/argp/standalone
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
