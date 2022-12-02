{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v0.7.5/wayfire-0.7.5.tar.xz
sha:f2e3184e72fe7999488fbba10bd38c29350b447489f02961aab5fa8438698b5c
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
lib/wf/config
lib/drivers/3d
lib/wlroots/16
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/wayland
{% endblock %}
