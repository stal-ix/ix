{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/KDE/kcoreaddons/archive/refs/tags/v5.113.0.tar.gz
#sha:9f5f87608638229ecd99eb21791112c9fc58bfd144510af51614542af874d1c3
https://github.com/KDE/kcoreaddons/archive/refs/tags/v5.247.0.tar.gz
sha:7d7ae4d787a4d91d7553ec6e7ef258547a874bceff40000a561c5fd2aac50a6c
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

{% block cpp_defines %}
QT_STATICPLUGIN
{% endblock %}

{% block install %}
{{super()}}
{# libudev-zero does not provide cmake targets #}
sed -e 's|.*find.*UDev.*||' -i ${out}/lib/cmake/KF6CoreAddons/KF6CoreAddonsConfig.cmake
sed -e 's|UDev::UDev|dl|' -i ${out}/lib/cmake/KF6CoreAddons/KF6CoreAddonsTargets.cmake
{% endblock %}
