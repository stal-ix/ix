{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.49.1.tar.gz
sha:94312ede44c6cae544ae316557e2651aea65efce5da06f8d44685db08392ec5d
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
