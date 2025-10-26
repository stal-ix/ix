{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
elfutils
{% endblock %}

{% block version %}
0.194
{% endblock %}

{% block fetch %}
http://sourceware.org/elfutils/ftp/{{self.version().strip()}}/elfutils-{{self.version().strip()}}.tar.bz2
09e2ff033d39baa8b388a2d7fbc5390bfde99ae3b7c67c7daaf7433fbcf0f01e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/fts
#__cxa_demangle
lib/c++
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

{% block make_flags %}
READELF=true
{% endblock %}

{% block setup_target_flags %}
# stack
export CTRFLAGS="${CPPFLAGS} ${CTRFLAGS}"
{% endblock %}
