{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.6.5.tar.gz
sha:7c56627c8098cf8b78ae0b045ff208f2815ba0a6cbab0c4a6a71128bafb81ff5
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
lib/xkbcommon
lib/wlroots/16
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}
