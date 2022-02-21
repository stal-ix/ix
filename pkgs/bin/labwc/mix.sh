{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.5.0.tar.gz
sha:fde97dae137b29336e0cab678700108872cc9d2093ad89d0f1dde2f21871496b
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/xml2
lib/pango
lib/cairo
lib/input
lib/wayland
lib/xkbcommon
lib/wlroots/15
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
xwayland=disabled
{% endblock %}

{% block c_rename_symbol %}
server_init
server_finish
{% endblock %}
