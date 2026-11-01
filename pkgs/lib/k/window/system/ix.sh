{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kwindowsystem
{% endblock %}

{% block version %}
6.31.0
{% endblock %}

{% block fetch %}
https://invent.kde.org/frameworks/kwindowsystem/-/archive/v{{self.version().strip()}}/kwindowsystem-v{{self.version().strip()}}.tar.bz2
b1211b4bc29ec227ef9227a380c143da136b9d4ba04b9569110e06e4d4a6a56d
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
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
KWINDOWSYSTEM_X11=OFF
KWINDOWSYSTEM_WAYLAND=ON
{% endblock %}

{% block build_flags %}
wrap_cc
no_werror
shut_up
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): fixme'
{% endblock %}
