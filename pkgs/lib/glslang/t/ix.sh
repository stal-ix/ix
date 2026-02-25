{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glslang
{% endblock %}

{% block version %}
16.2.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/{{self.version().strip()}}.tar.gz
01985335785c97906a91afe3cb5ee015997696181ec6c125bab5555602ba08e2
{% endblock %}

{% block bld_tool %}
bld/bison
bld/python
{% endblock %}

{% block lib_deps %}
lib/c
lib/spirv/tools
lib/spirv/headers
{% endblock %}

{% block cmake_flags %}
ENABLE_OPT=ON
ALLOW_EXTERNAL_SPIRV_TOOLS=ON
{% endblock %}
