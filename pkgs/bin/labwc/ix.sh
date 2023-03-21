{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.6.2.tar.gz
sha:f2a91edea4069ba0a9d759e096a8e96434eb3d36d54ccbbba486d66f5b8060f3
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
