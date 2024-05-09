{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/3.0.3.tar.gz
sha:a649205a90e39a548863a3614a9576a3fb4465f8e8e66d54999f127957c25b21
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
