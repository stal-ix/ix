{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wasm-micro-runtime
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-{{self.version().strip()}}.tar.gz
sha:542bdc941fd88b125057d5337e14e3abb8690223069d9503110ecbd2dbdc1ea6
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
