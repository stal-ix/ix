{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v0.8.0/wayfire-0.8.0.tar.xz
sha:6e6af885c08822e3a0b1fd748e1ee75e29bc000e376f6613b26c564f8cbc2baf
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/png
lib/glm
lib/jpeg
lib/seat
lib/cairo
lib/pango
lib/evdev
lib/input
lib/xml/2
lib/pixman
lib/opengl
lib/wayland
lib/freetype
lib/execinfo
lib/xkbcommon
lib/drivers/3d
lib/wlroots/16
lib/json/nlohmann/11
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/wayland
{% endblock %}
