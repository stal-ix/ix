{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/sdk-1.3.236.0.tar.gz
sha:5b0d96acce7d7354a6bc055cafeca9191cda860975390780b3146b8ab1f8a8d3
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
BUILD_WERROR=OFF
BUILD_WSI_XCB_SUPPORT=OFF
BUILD_WSI_XLIB_SUPPORT=OFF
CUBE_WSI_SELECTION=WAYLAND
{% endblock %}
