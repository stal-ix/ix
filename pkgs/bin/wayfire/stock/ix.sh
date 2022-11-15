{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v0.7.4/wayfire-0.7.4.tar.xz
sha:89e375f7320d7bd4023d9f9499f979ee7209594afbb5aa0cfd897934a7f0514d
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
lib/wlroots/15
lib/mesa/glesv2
{% endblock %}

{% block bld_tool %}
bld/scripts/dlfcn
bld/wayland
{% endblock %}
