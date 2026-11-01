{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
elfutils
{% endblock %}

{% block version %}
0.197
{% endblock %}

{% block fetch %}
https://sourceware.org/elfutils/ftp/{{self.version().strip()}}/elfutils-{{self.version().strip()}}.tar.bz2
1fdf525f22dcf796d99a99ba3ea00a1f7b1ae5421bc62e8443a708920b99b904
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
