{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/5.0.1.tar.gz
sha:2b9c66915923fdc42e0e32e2a9d7d83d3534a45bb235e163a70047951890c01a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CAPSTONE_BUILD_TESTS=OFF
CAPSTONE_BUILD_SHARED=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version: .*|Version: 5.0|' -e 's|archs=.*||' -i ${out}/lib/pkgconfig/capstone.pc
{% endblock %}
