{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kwindowsystem
{% endblock %}

{% block version %}
6.29.0
{% endblock %}

{% block fetch %}
https://invent.kde.org/frameworks/kwindowsystem/-/archive/v{{self.version().strip()}}/kwindowsystem-v{{self.version().strip()}}.tar.bz2
5bfc959cff452d40493110921c10fe039abe4f9b8c5ac54c0ce26cb71188229c
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
no_werror
shut_up
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): fixme'
{% endblock %}
