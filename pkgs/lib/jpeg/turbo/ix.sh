{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libjpeg-turbo
{% endblock %}

{% block version %}
3.1.2
{% endblock %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/{{self.version().strip()}}.tar.gz
560f6338b547544c4f9721b18d8b87685d433ec78b3c644c70d77adad22c55e6
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
