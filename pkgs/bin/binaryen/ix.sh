{% extends '//die/c/cmake.sh' %}

{% block version %}
126
{% endblock %}

{% block pkg_name %}
binaryen
{% endblock %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_{{self.version().strip()}}.tar.gz
f1c53762abae21cb6bc3e55d4e96d4ca4ea261f83a51d2aa47abc75d60e683e7
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
