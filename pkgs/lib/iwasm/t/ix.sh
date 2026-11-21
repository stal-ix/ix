{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wasm-micro-runtime
{% endblock %}

{% block version %}
2.4.6
{% endblock %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-{{self.version().strip()}}.tar.gz
6a8de3f74671a72698b4bd61a96c1ce8966db077b2adad7b720757cfd9caff62
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cmake_flags %}
{{super()}}
WAMR_BUILD_SIMD=OFF
{% endblock %}
