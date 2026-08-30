{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libuv
{% endblock %}

{% block version %}
1.52.1
{% endblock %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
478baf2599bfbc882c355288c9cb6f92e0e7dda435fa04031fa5b607cf3f414c
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
