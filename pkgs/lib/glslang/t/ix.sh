{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/vulkan-sdk-1.3.275.0.tar.gz
sha:920f99e7d37c6f74e97e5e4b0aeded8b6524b1cbf6a1ed4e760ed3b4b1250077
{% endblock %}

{% block bld_tool %}
bld/bison
bld/python
{% endblock %}

{% block lib_deps %}
lib/c
lib/vulkan/spirv/tools
lib/vulkan/spirv/headers
{% endblock %}

{% block cmake_flags %}
ENABLE_OPT=ON
ALLOW_EXTERNAL_SPIRV_TOOLS=ON
{% endblock %}
