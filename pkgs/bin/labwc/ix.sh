{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
labwc
{% endblock %}

{% block version %}
0.9.3
{% endblock %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/{{self.version().strip()}}.tar.gz
38d273faa4e021b9f99e1bf1a5f4bf881cc6a592e00c7b3426b37c0a0b67d126
{% endblock %}

{% block bld_libs %}
lib/c
lib/sfdo
lib/glib
lib/xml/2
lib/pango
lib/cairo
lib/input
lib/wayland
lib/shim/x11
lib/xkb/common
lib/drivers/3d
lib/wlroots/{{self.version().strip() | field(1) | add(10)}}
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
