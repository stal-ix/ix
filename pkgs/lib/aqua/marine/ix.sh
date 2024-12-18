{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/aquamarine/archive/refs/tags/v0.4.5.tar.gz
sha:53b9d988377d1a8b7302b18b01db79fe14067a3d8ff94b4c7f93cdcadb6e6e41
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/drm
lib/seat
lib/input
lib/opengl
lib/pixman
lib/wayland
lib/hypr/utils
lib/display/info
lib/shim/fake(lib_name=GL)
{% endblock %}

{% block bld_data %}
aux/hwdata
{% endblock %}

{% block bld_tool %}
bld/wayland
bin/hypr/wayland/scanner
{% endblock %}

{% block configure %}
export WAYLAND_CLIENT_DIR=$(dirname $(dirname $(which wayland-scanner)))/share/wayland
{{super()}}
{% endblock %}

{% block cmake_flags %}
WAYLAND_CLIENT_DIR=${WAYLAND_CLIENT_DIR}
{% endblock %}

{% block patch %}
sed -e 's|.*pkg.*WAYLAND_CLIENT_DIR.*||' \
    -e 's|OpenGL::OpenGL||' \
    -i CMakeLists.txt
{% endblock %}
