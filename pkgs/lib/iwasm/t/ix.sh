{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wasm-micro-runtime
{% endblock %}

{% block version %}
2.4.1
{% endblock %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-{{self.version().strip()}}.tar.gz
f36650ef534f8bc138ed38385d46cfa5d053fb5696f799a9c783b62418ba726b
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
