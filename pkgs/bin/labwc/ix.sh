{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.6.1.tar.gz
sha:c951050d4a2c2afc71d52d8138f8f4ef7ed2a2c9a337dc9de146c8b1e97cf952
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

{% block c_rename_symbol %}
server_init
server_finish
{% endblock %}
