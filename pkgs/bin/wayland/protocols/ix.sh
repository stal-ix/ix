{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wayland-project/wayland-protocols/archive/refs/tags/1.31.tar.gz
sha:04d3f66eca99d638ec8dbfdfdf79334290e22028f7d0b04c7034d9ef18a3248a
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
