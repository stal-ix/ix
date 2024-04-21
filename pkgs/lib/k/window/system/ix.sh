{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://invent.kde.org/frameworks/kwindowsystem/-/archive/v6.1.0/kwindowsystem-v6.1.0.tar.bz2
sha:62c1ef619daf1972b18fd81a69e31e8698b013d5c17b44adf5289d3d60556e8e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/k/ecm
lib/k/pwp
lib/qt/6/base
lib/qt/6/wayland
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/wayland
bld/qt/6/tools
bld/qt/6/wayland
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
KWINDOWSYSTEM_X11=OFF
KWINDOWSYSTEM_WAYLAND=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): fixme'
{% endblock %}
