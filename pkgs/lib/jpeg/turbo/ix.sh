{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/3.0.1.tar.gz
sha:5b9bbca2b2a87c6632c821799438d358e27004ab528abf798533c15d50b39f82
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{% if x86_64 %}
REQUIRE_SIMD=ON
{% endif %}
ENABLE_SHARED=OFF
{% endblock %}
