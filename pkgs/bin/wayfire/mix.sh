{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v0.7.2/wayfire-0.7.2.tar.xz
sha:c6785613df438e64aa5dcce798a0205c83cd2f36102669fcfd0050e7a58c5abd
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/png
lib/glm
lib/mesa
lib/xml2
lib/jpeg
lib/seat
lib/cairo
lib/pango
lib/evdev
lib/input
lib/pixman
lib/wayland
lib/mesa/egl
lib/freetype
lib/execinfo
lib/xkbcommon
lib/wl/config
lib/drivers/3d
lib/wlroots/14
lib/mesa/glesv2
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}
