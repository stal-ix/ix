{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glslang
{% endblock %}

{% block version %}
16.1.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/{{self.version().strip()}}.tar.gz
32c605822ed63a0cdc2d24f318c3d912fa14e58573aff1d8eac0cf69f1a6b6d2
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
