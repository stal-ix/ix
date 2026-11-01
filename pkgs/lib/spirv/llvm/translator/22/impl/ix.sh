{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
22.1.8
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
895bca0285fd4118800912a54527c0ae0d0c6e62591e807c3c96c6b342c4c5e2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/22
lib/spirv/tools
{% endblock %}

{% block bld_libs %}
lib/spirv/headers/next
{% endblock %}

lib/spirv/headers
{% block bld_tool %}
bld/spirv/tools
{% endblock %}

{% block cmake_flags %}
LLVM_SPIRV_INCLUDE_TESTS=OFF
LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/
{% endblock %}
