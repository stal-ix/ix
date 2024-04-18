{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/1.35/wayland-protocols-1.35.tar.bz2
sha:6d3ef6470be97dd8290d4cba513c1601c64ec8d23c47f73b120c6172899f4c8a
{% endblock %}

{% block bld_tool %}
bld/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}

{% block env %}
export WL_PROTOCOL_DIR=${out}/share/wayland-protocols
{% endblock %}
