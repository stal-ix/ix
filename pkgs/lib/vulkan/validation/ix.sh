{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/refs/tags/sdk-1.3.236.0.tar.gz
sha:68f2cf70b1960f85e931ef56935e6ceda1beeb214f8fa319e6b95128b02b485a
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
