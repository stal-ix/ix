{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libjpeg-turbo
{% endblock %}

{% block version %}
3.1.3
{% endblock %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/{{self.version().strip()}}.tar.gz
3a13a5ba767dc8264bc40b185e41368a80d5d5f945944d1dbaa4b2fb0099f4e5
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
