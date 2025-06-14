{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kimageformats
{% endblock %}

{% block version %}
6.15.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/kimageformats/archive/refs/tags/v{{self.version().strip()}}.tar.gz
518b5dd672f0090bd35c3ab472799d15acab26256f74a26a016b73fa6175eaaf
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
