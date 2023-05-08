{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.6.3.tar.gz
sha:a19ada70e40b90c759cf61094b4df96f907527f743b7e669da243d3ca3554ca2
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
