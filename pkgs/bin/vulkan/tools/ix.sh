{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/sdk-1.3.239.0.tar.gz
https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/sdk-1.3.250.0.tar.gz
sha:5f3ed1fddef8581bf188c9d079dd7c1662d8f779b682977ff0dc5942b13777f4
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
