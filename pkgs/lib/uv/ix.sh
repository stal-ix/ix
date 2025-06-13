{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libuv
{% endblock %}

{% block version %}
1.51.0
{% endblock %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
27e55cf7083913bfb6826ca78cde9de7647cded648d35f24163f2d31bb9f51cd
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
