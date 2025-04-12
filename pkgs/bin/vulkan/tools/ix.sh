{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Tools
{% endblock %}

{% block version %}
1.3.290.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
sha:9d8a941f3cedd904774e888871840dd9b5df4de7682d741181b5c9af58a46420
{% endblock %}

{% block bld_libs %}
lib/c
lib/volk
lib/kernel
lib/vulkan/loader
lib/vulkan/headers
lib/vulkan/drivers
{% endblock %}

{% block bld_tool %}
bld/python
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
