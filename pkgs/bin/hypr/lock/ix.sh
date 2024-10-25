{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprlock/archive/refs/tags/v0.5.0.tar.gz
sha:4f8a0199de205ad21a4e3da88c0196514a0ba3c6162e44f93e7cfb96371daf99
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pam
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
lib/shim/fake(lib_name=OpenGL)
lib/shim/fake(lib_name=GLX)
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's|OpenGL::GL||' -i CMakeLists.txt
{% endblock %}
