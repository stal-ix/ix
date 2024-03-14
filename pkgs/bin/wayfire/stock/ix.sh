{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v0.8.1/wayfire-0.8.1.tar.xz
sha:8ac1947b688a9ec6c4d9ee2d77311bb357a8ead25665b8000eda96952328290d
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
lib/xkb/common
lib/drivers/3d
lib/wlroots/17
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/wayland
{% endblock %}
