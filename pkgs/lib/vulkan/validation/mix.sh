{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/3dfeacfe0ad07415a4cac3122f07991688d97a2a.zip
57b193272998cdd0563ebc0064a36fe5
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
dev/tool/python
dev/build/pkg-config
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
