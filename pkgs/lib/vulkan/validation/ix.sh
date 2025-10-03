{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-ValidationLayers
{% endblock %}

{% block version %}
1.4.321.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
80f929ac4e9a1810401064fcd3a789a98006c7916b73b215c235a5f538daa5e9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/robin/hood
lib/vulkan/headers
lib/vulkan/utility
lib/spirv/headers
lib/spirv/tools
{% endblock %}

{% block bld_tool %}
bld/python
bld/pkg/config
lib/spirv/tools
{% endblock %}

{% block cmake_flags %}
BUILD_WERROR=OFF
BUILD_WSI_XCB_SUPPORT=OFF
BUILD_WSI_XLIB_SUPPORT=OFF
BUILD_WSI_WAYLAND_SUPPORT=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
cp ${out}/lib/lib* ${out}/lib/libVkLayer_khronos_validation.a
{% endblock %}
