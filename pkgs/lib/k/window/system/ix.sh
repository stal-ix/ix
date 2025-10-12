{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kwindowsystem
{% endblock %}

{% block version %}
6.19.0
{% endblock %}

{% block fetch %}
https://invent.kde.org/frameworks/kwindowsystem/-/archive/v{{self.version().strip()}}/kwindowsystem-v{{self.version().strip()}}.tar.bz2
48384ff2e2f3b28595c079ab11b5097991a3af3ca59096ef12819ed1ad21b624
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
