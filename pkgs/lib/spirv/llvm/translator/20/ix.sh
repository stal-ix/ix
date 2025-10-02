{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
20.1.7
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dd8a018becb2ed3647478744549b09372308f763d37d5fcde137fd9e129a7354
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/20
lib/spirv/tools
lib/spirv/headers
{% endblock %}

{% block bld_tool %}
bld/spirv/tools
{% endblock %}

{% block cmake_flags %}
LLVM_SPIRV_INCLUDE_TESTS=OFF
LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/
{% endblock %}
