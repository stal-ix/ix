{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxkbcommon
{% endblock %}

{% block version %}
1.13.2
{% endblock %}

{% block fetch %}
https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-{{self.version().strip()}}.tar.gz
acc4d5f7c3cbba5f9f8d08d8bdbeede84ecede46792f47929aa9321873385528
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/wayland
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
lib/wayland
{% endblock %}

{% block meson_flags %}
enable-x11=false
enable-docs=false
{% endblock %}

{% block c_rename_symbol %}
parse_string
# lib/flite conflict
utf8_sequence_length
{% endblock %}

{% block patch %}
sed -e 's|locale.h||' -i meson.build
sed -e '/^# Tests$/a if false' -e '/^# Documentation\.$/i endif' -i meson.build
sed -e '/^# Tests$/a has_merge_modes_tests = false' -i meson.build
{% endblock %}
