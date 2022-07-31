{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v0.7.3/wayfire-0.7.3.tar.xz
sha:99d1d51b1db88c30de6484094fd02df39a82cbb503361e52abc1d94f8357cb5f
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
lib/wf/config
lib/drivers/3d
lib/wlroots/15
lib/mesa/glesv2
{% endblock %}

{% block bld_tool %}
bld/scripts/dlfcn
bld/wayland
{% endblock %}
