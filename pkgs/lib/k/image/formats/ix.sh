{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
kimageformats
{% endblock %}

{% block version %}
6.19.0
{% endblock %}

{% block fetch %}
https://github.com/KDE/kimageformats/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0cc9b8c0e87fba771a9e92da009702bdb753cf4cb9cda1e5cc838f3e46574c51
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
