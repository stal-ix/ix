{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.8.2.tar.gz
sha:1adba1c87ec26f2f00409b47a0b79ccfd68bd160e1abc41822fb01f0a76ee947
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
