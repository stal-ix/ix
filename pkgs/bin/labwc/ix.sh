{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.7.0.tar.gz
sha:2607219cb766db4d258a20c62c98ea16cd6d62c735e65f35d916188cf0ccbe70
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/xml/2
lib/pango
lib/cairo
lib/input
lib/wayland
lib/shim/x11
lib/xkb/common
lib/wlroots/17
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
