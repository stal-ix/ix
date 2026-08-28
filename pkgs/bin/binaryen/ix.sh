{% extends '//die/c/cmake.sh' %}

{% block version %}
132
{% endblock %}

{% block pkg_name %}
binaryen
{% endblock %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_{{self.version().strip()}}.tar.gz
ede5e20f2f5148641bad31ceaef3c1fd4de4fb63b2d7b5081c605ba475483f6b
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
