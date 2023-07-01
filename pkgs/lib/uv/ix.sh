{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.46.0.tar.gz
sha:7aa66be3413ae10605e1f5c9ae934504ffe317ef68ea16fdaa83e23905c681bd
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
