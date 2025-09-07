{% extends '//die/c/cmake.sh' %}

{% block version %}
124
{% endblock %}

{% block pkg_name %}
binaryen
{% endblock %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_{{self.version().strip()}}.tar.gz
b8d06af81a8c2bb27c34d1f9e3cf7c621f93fc901f896809e0490f3586a63ca4
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
