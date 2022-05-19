{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/labwc/labwc/archive/refs/tags/0.5.2.tar.gz
sha:ad00412f17dedd6eb0113d0fd07c22abf4c8e5f322f3e93db4a7ab973fdf1922
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
