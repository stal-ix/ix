{% extends '//die/c/cmake.sh' %}

{% block version %}
0.7.1
{% endblock %}

{% block fetch %}
https://github.com/microsoft/snmalloc/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:91824fdf553f03cf6ef8be57f29f1d4f79cd651667455e9fe4af8b7c09e705d3
{% endblock %}

{% block lib_deps %}
lib/c/naked
lib/reallocarray
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c++/headers
{% endblock %}

{% block patch %}
rm -rf src/test/func
rm -rf src/test/perf
{% endblock %}

{% block install %}
mkdir ${out}/lib

find ${tmp} -name '*.a' | grep -v static | grep {% block kind %}{% endblock %} | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}
