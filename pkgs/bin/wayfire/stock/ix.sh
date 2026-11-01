{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayfire
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v{{self.version().strip()}}/wayfire-{{self.version().strip()}}.tar.xz
29dc95468c4f954341c9ecbad889b661eb849bdb96fb47e19c9d6edc8d49640b
{% endblock %}

{% block bld_libs %}
lib/c
lib/omp
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
lib/wlroots/20
lib/json/yy
lib/json/nlohmann
# {{opengl | defined('opengl')}}
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/wayland
{% endblock %}
