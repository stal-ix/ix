{% extends '//die/c/cmake.sh' %}

{% block version %}
3.1.0
{% endblock %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:35fec2e1ddfb05ecf6d93e50bc57c1e54bc81c16d611ddf6eff73fff266d8285
{% endblock %}

{% block bld_tool %}
bld/nasm
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
