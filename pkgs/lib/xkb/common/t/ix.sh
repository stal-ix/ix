{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxkbcommon
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block fetch %}
https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-{{self.version().strip()}}.tar.gz
bf9d9e0283ef4211f1f3f228787d38ba095fe9f0e84c5f798b6a8661033a9b51
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
