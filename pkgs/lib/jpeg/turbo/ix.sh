{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libjpeg-turbo
{% endblock %}

{% block version %}
3.1.1
{% endblock %}

{% block fetch %}
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:304165ae11e64ab752e9cfc07c37bfdc87abd0bfe4bc699e59f34036d9c84f72
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
