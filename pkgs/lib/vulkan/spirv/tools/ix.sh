{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-Tools
{% endblock %}

{% block version %}
1.4.313.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.zip
sha:def5f8e9ec40a2d5c56b5e32d5f6ca9d7a1a7024dcff1f59fa0b02232f8110b9
{% include '//lib/vulkan/spirv/headers/ver.sh' %}
{% endblock %}

{% block unpack %}
extract1 ${src}/*zip

(
    cd external
    extract 0 ${src}/*gz
    ln -s S* spirv-headers
)
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
SPIRV_COLOR_TERMINAL=ON
SPIRV_WERROR=OFF
SPIRV_SKIP_TESTS=YES
SPIRV_TOOLS_BUILD_STATIC=ON
SPIRV_TOOLS_LIBRARY_TYPE=STATIC
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
rm libSPIRV-Tools-shared.a
ln -s libSPIRV-Tools.a libSPIRV-Tools-shared.a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
