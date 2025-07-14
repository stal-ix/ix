{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kcoreaddons
{% endblock %}

{% block version %}
6.16.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/kcoreaddons/archive/refs/tags/v{{self.version().strip()}}.tar.gz
58bfdab8f21bac10a6aa568daac4dba57e9ba70bf387856dfd96a08a0e35418d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/k/ecm
lib/qt/6/base
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

{% block install %}
{{super()}}
{# libudev-zero does not provide cmake targets #}
sed -e 's|.*find.*UDev.*||' -i ${out}/lib/cmake/KF6CoreAddons/KF6CoreAddonsConfig.cmake
sed -e 's|UDev::UDev|dl|' -i ${out}/lib/cmake/KF6CoreAddons/KF6CoreAddonsTargets.cmake
{% endblock %}
