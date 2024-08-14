{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/aquamarine/archive/refs/tags/v0.3.1.tar.gz
sha:fcd1fd001bfbb0555004d86a0a57e3eb89c01eae0e25c171dc22c45b4d0cf860
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
sed -e 's|.*pkg.*WAYLAND_CLIENT_DIR.*||' -i CMakeLists.txt
{% endblock %}
