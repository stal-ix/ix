{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprlock
{% endblock %}

{% block version %}
0.8.1
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprlock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e378dae895964eb2a98cdc2ae60be6acc96b2a5fa18cea831c3323b4f6f971c6
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pam
lib/gbm
lib/date
lib/jpeg
lib/webp
lib/cairo
lib/pango
lib/magic
lib/opengl
lib/wayland
lib/hypr/lang
lib/hypr/utils
lib/xkb/common
lib/drivers/3d
lib/sd/bus/c++/2
lib/hypr/graphics
lib/shim/fake(lib_name=OpenGL)
lib/shim/fake(lib_name=GLX)
{% endblock %}

{% block bld_tool %}
bld/prepend
bld/wayland
bin/hypr/wayland/scanner
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|190100|10005000|' \
    -i src/renderer/widgets/IWidget.cpp
{% endblock %}
