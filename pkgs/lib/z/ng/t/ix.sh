{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
zlib-ng
{% endblock %}

{% block version %}
2.2.2
{% endblock %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fcb41dd59a3f17002aeb1bb21f04696c9b721404890bb945c5ab39d2cb69654c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ZLIB_ENABLE_TESTS=OFF
{% endblock %}
