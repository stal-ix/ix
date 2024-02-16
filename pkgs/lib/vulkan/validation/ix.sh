{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/refs/tags/vulkan-sdk-1.3.275.0.tar.gz
sha:acfd84039109220129624b0ecb69980bbc3a858978c62b556dbe16efd0f26755
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/robin/hood
lib/vulkan/headers
lib/vulkan/utility
lib/vulkan/spirv/headers
lib/vulkan/spirv/tools
{% endblock %}

{% block bld_tool %}
bld/python
bld/pkg/config
lib/vulkan/spirv/tools
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
