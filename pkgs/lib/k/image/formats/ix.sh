{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kimageformats
{% endblock %}

{% block version %}
6.32.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/kimageformats/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2d4149e43d6e5d4a6959fc801901e95f4e2f7f4acebe417c180485afb697a6c1
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
