{% extends '//die/c/pybuild.sh' %}

{% block version %}
11
{% endblock %}

{% block fetch %}
https://github.com/pg83/std/archive/refs/tags/{{self.version().strip()}}.tar.gz
ee6a1087989b4eeb06d0f001b7e4f52ad9e3937273f18651698669071c3a8d7f
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/rapidhash
lib/linux/headers
{% endblock %}

{% block pybuild_target %}
libstd
{% endblock %}

{% block install %}
mkdir ${out}/lib
mkdir ${out}/include
cp libstd ${out}/lib/libstd.a
find std -type d | while read l; do
    mkdir -p ${out}/include/${l}
done
find std -type f -name '*.h' | while read l; do
    cp ${l} ${out}/include/${l}
done
{% endblock %}
