{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
20.1.1
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3b2a750bbaea4a084e90fd88de317f9a03879056e3bd429bb56c588f4c77ca16
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/21
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
