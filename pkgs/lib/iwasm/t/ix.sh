{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wasm-micro-runtime
{% endblock %}

{% block version %}
2.4.3
{% endblock %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-{{self.version().strip()}}.tar.gz
4ac27e697a3e64959756624d68ec18ce5fc54a2d3f31f1b3f702be6fcd48a7d8
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
