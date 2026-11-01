{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
21.1.13
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f80d32d266df54eeb75e41b87ed4ea4bfdbe8f0eaea510de1d7cc3f088ebbd9d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/21
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
