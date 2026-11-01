{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libjpeg-turbo
{% endblock %}

{% block version %}
3.2.1
{% endblock %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/{{self.version().strip()}}.tar.gz
6f5819c51649bce2571a23b1b0cd41eae2f57fc3f8908c7ec9e7047efb65ca13
{% endblock %}

{% block bld_tool %}
{% if x86_64 %}
bld/nasm
{% endif %}
{% endblock %}

{% block bld_libs %}
{% if wasi %}
lib/shim/setjmp
{% endif %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block cmake_flags %}
{% if x86_64 %}
REQUIRE_SIMD=ON
{% endif %}
ENABLE_SHARED=OFF
WITH_SYSTEM_ZLIB=ON
{% endblock %}
