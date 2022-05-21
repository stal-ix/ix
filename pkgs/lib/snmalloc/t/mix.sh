{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/snmalloc/archive/refs/tags/0.6.0.tar.gz
sha:de1bfb86407d5aac9fdad88319efdd5593ca2f6c61fc13371c4f34aee0b6664f
{% endblock %}

{% block lib_deps %}
lib/c/naked
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
