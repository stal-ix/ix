{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kcoreaddons
{% endblock %}

{% block version %}
6.31.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/kcoreaddons/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c5b4e79d1ea0ff3ad0c45db9b5ea6170f81e4d4db0f5c4693a3c1e92a1016694
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/k/ecm
lib/linux/util
lib/qt/6/base
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|set(REQUIRED_QT_VERSION 6.10.0)|set(REQUIRED_QT_VERSION 6.7.0)|' -i CMakeLists.txt
sed -e '/#include <array>/a#include <span>' -i src/lib/util/ksafestringerror.cpp
{% endblock %}

{% block install %}
{{super()}}
{# libudev-zero does not provide cmake targets #}
sed -e 's|.*find.*UDev.*||' -i ${out}/lib/cmake/KF6CoreAddons/KF6CoreAddonsConfig.cmake
sed -e 's|UDev::UDev|dl|' -i ${out}/lib/cmake/KF6CoreAddons/KF6CoreAddonsTargets.cmake
{% endblock %}
