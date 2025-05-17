{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glslang
{% endblock %}

{% block version %}
15.3.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:c6c21fe1873c37e639a6a9ac72d857ab63a5be6893a589f34e09a6c757174201
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
