{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/refs/tags/sdk-1.3.261.1.tar.gz
sha:1372d522f297bb3fb386802b1aa4b7f885a9e1e969a6a3c6e9b29d381357f21d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/robin/hood
lib/vulkan/headers
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
