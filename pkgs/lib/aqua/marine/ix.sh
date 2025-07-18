{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
aquamarine
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/aquamarine/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d4316663df8c7f4834bae8c4fe9b67e53a4ec576c713bc3d829b394149edad14
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gbm
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
