{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wasm-micro-runtime
{% endblock %}

{% block version %}
2.4.5
{% endblock %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-{{self.version().strip()}}.tar.gz
1ab09d51099f276ca4a1d6629f6b589aab2bd0caa01445e05031a4bed22c199b
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
