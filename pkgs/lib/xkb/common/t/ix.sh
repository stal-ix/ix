{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxkbcommon
{% endblock %}

{% block version %}
1.13.0
{% endblock %}

{% block fetch %}
https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-{{self.version().strip()}}.tar.gz
cd9367eec501867dfe7ddc3f6b18a026f2a2844a89d19108448d376cb849c9ed
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

{% block use_data %}
aux/x11/locale
aux/xkeyboard/config
{% endblock %}

{% block meson_flags %}
enable-x11=false
enable-docs=false
x-locale-root=${X11_LOCALE_DIR}
xkb-config-root=${XKB_CONFIG}
{% endblock %}

{% block c_rename_symbol %}
parse_string
# lib/flite conflict
utf8_sequence_length
{% endblock %}

{% block patch %}
sed -e 's|locale.h||' -i meson.build
{% endblock %}
