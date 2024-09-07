{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_119.tar.gz
sha:9c2614212f628fad451b847ffa0ce2fc59339453f4ea1bacf4417590caa5fc71
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}
