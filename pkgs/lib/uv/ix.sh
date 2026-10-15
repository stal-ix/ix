{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libuv
{% endblock %}

{% block version %}
1.53.0
{% endblock %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
279f3f67a24bb9921fe999ca6cd5e332fade8d515873ef9ba054b70e70a31d9e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux/headers
{% endblock %}

{% block cmake_flags %}
LIBUV_BUILD_TESTS=OFF
LIBUV_BUILD_BENCH=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
