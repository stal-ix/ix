{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.49.0.tar.gz
sha:a10656a0865e2cff7a1b523fa47d0f5a9c65be963157301f814d1cc5dbd4dc1d
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
