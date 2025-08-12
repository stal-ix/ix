{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kwindowsystem
{% endblock %}

{% block version %}
6.17.0
{% endblock %}

{% block fetch %}
https://invent.kde.org/frameworks/kwindowsystem/-/archive/v{{self.version().strip()}}/kwindowsystem-v{{self.version().strip()}}.tar.bz2
ac92e8fbd9c32066e7070a72b604a2280a78e8a3f29c27cad3f107b2e2aa2988
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
