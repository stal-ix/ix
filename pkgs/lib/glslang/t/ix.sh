{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/sdk-1.3.261.1.tar.gz
sha:eb1f9c2ff0a1409151d7749fb37bc1988dc1fd908444c1e4f43d4190c90befcd
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

{% block patch %}
sed -e 's|.*add_link_options.*||' -e 's|.*set.*ENABLE_OPT.*||' -i CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
ENABLE_OPT=ON
{% endblock %}
