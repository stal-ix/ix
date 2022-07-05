{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/sdk-1.3.211.0.tar.gz
sha:4335eec84b87d64130e860dad5d6dc1f722277d4e0ff5027153e2743628cb221
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

{% block env_lib %}
export CPPFLAGS="-DENABLE_OPT=1 \${CPPFLAGS}"
{% endblock %}
