{% extends '//die/c/cmake.sh' %}

{% block fetch %}
# 99 conflicts with current avif
https://github.com/KDE/kimageformats/archive/refs/tags/v5.98.0.tar.gz
sha:b5424d53e90a06b5a3243803a0e9b7da92d912aee48f8010140fa2e241cc7a28
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/heif
lib/avif
lib/k/ecm
lib/openexr
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block cmake_flags %}
KIMAGEFORMATS_HEIF=ON
{% endblock %}

{% block install %}
{{super()}}
find ${out}/lib/plugins -name '*.a' -type f | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}

{% block cpp_defines %}
QT_STATICPLUGIN
{% endblock %}
