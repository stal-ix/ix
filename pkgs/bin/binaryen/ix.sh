{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_117.tar.gz
sha:9acf7cc5be94bcd16bebfb93a1f5ac6be10e0995a33e1981dd7c404dafe83387
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}
