{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_113.tar.gz
sha:d2c32e85587ae95001a78a8765e12556be0fa8965e2f1fa6fc622aa2e0c4a33d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}
