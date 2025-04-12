{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glslang
{% endblock %}

{% block version %}
1.3.296.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
sha:a7a5e845ee46b02a762c137e35245079774b8b830034883d6b73ba0023e24f56
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
