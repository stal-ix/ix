{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/sdk-1.3.224.1.tar.gz
sha:fa88ab7a542cc3ec05d22316ffedce7c058350efe79ec5e019c405ab268d17a0
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/drivers/3d
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bin/glslang
bld/wayland
bld/pkg/config
{% endblock %}

{% block cmake_flags %}
BUILD_ICD=NO
BUILD_WSI_XCB_SUPPORT=OFF
BUILD_WSI_XLIB_SUPPORT=OFF
CUBE_WSI_SELECTION=WAYLAND
{% endblock %}
