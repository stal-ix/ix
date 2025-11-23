{% extends '//die/c/cmake.sh' %}

{% block version %}
125
{% endblock %}

{% block pkg_name %}
binaryen
{% endblock %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_{{self.version().strip()}}.tar.gz
36177034ef0f0d826fd7dc9ab9d92ef20190a79d69856f764151ffe9c11d7350
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
