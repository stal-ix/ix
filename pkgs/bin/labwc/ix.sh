{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.5.3.tar.gz
sha:0b67bc89a5d9059fae28822f3ba2373553dea290cd931c9384a91dbeb2054650
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/xml2
lib/pango
lib/cairo
lib/input
lib/wayland
lib/wlroots
lib/xkbcommon
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
