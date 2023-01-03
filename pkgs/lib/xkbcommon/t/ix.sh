{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-1.5.0.tar.gz
sha:053e6a6a2c3179eba20c3ada827fb8833a6663b7ffd278fdb8530c3cbf924780
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
aux/xkeyboard/config
{% endblock %}

{% block meson_flags %}
enable-x11=false
enable-docs=false
xkb-config-root="${XKB_CONFIG}"
{% endblock %}

{% block c_rename_symbol %}
parse_string
{% endblock %}
