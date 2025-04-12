{% extends '//die/c/meson.sh' %}

{% block version %}
0.8.3
{% endblock %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:746be2ff2d0c0c0b795c97fa24c7058f75586685c88a1194c243b6a846f938a5
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
lib/wlroots/18
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
