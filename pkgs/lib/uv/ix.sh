{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libuv
{% endblock %}

{% block version %}
1.50.0
{% endblock %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b1ec56444ee3f1e10c8bd3eed16ba47016ed0b94fe42137435aaf2e0bd574579
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBUV_BUILD_TESTS=OFF
LIBUV_BUILD_BENCH=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
