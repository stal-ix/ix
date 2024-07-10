{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_118.tar.gz
sha:58a2fbad5aa986b52f8044c99fa7780e0a524e3d1bcc4f588ccda62bc33498a7
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}
