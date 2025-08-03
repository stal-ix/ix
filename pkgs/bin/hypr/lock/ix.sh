{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprlock
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprlock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
03f26ceba049546767a903a5e5bcd78fa4d261a5d116febd45633b88b9f16a97
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
