{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glslang
{% endblock %}

{% block version %}
15.4.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/{{self.version().strip()}}.tar.gz
b16c78e7604b9be9f546ee35ad8b6db6f39bbbbfb19e8d038b6fe2ea5bba4ff4
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
