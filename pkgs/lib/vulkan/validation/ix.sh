{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/refs/tags/sdk-1.3.211.0.tar.gz
sha:
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

{% block patch %}
find . | grep CMakeLists.txt | while read l; do
    sed -e 's|SHARED|STATIC|' -i ${l}
done
{% endblock %}
