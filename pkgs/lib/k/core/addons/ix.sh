{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kcoreaddons
{% endblock %}

{% block version %}
6.18.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/kcoreaddons/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5f28c4393e1ddc17cd8c76154304c216abf1a633a7e03451c3bec3cfdde475cd
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
