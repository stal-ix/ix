{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sddm/sddm/archive/refs/tags/v0.20.0.tar.gz
sha:467c8bd91e0d4f76d4bc4e57ab334f1f48a33478482ba9476d93b0b3d7ace9fb
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pam
lib/k/ecm
lib/wayland
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/wayland
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
NO_SYSTEMD‎=ON
BUILD_WITH_QT6‎=ON
ENABLE_JOURNALD‎=OFF
{% endblock %}
