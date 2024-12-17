{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_121.tar.gz
sha:93f3b3d62def4aee6d09b11e6de75b955d29bc37878117e4ed30c3057a2ca4b4
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}
