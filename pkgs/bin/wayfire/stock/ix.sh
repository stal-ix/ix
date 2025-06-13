{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayfire
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block fetch %}
https://github.com/WayfireWM/wayfire/releases/download/v{{self.version().strip()}}/wayfire-{{self.version().strip()}}.tar.xz
dd0c9c08b8a72a2d8c3317c8be6c42b17a493c25abab1d02ac09c24eaa95229d
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
lib/wlroots/17
lib/json/nlohmann
# {{opengl | defined('opengl')}}
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/wayland
{% endblock %}
