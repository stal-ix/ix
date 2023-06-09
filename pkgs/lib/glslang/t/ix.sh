{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/glslang/archive/refs/tags/sdk-1.3.224.1.tar.gz
sha:42688248855581cd6a338a483a9068a27a9a3502cfd0256afc98b836722504cc
# broken lib/shaderc
#https://github.com/KhronosGroup/glslang/archive/refs/tags/sdk-1.3.250.0.tar.gz
#sha:0a1cf51ee4659c4abb8765b34beb5d88501b7da5a5c389b69c5d2934f56d4b58
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
