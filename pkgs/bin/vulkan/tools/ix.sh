{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/vulkan-sdk-1.3.268.0.tar.gz
sha:735631a595a4d7962e3221a410ceb60f5e069c98bd3309dd2ccc9f028a71788a
#https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/v1.3.271.tar.gz
#sha:8cbc2fd27326de0e7d16ceab6463f4c1c116f8c0699e5621cdc0eded07f3105a
#https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/vulkan-sdk-1.3.275.0.tar.gz
#sha:a1c876a6c2882e365141942641a38e0a7bfa6684a7dcedbb0066a20c06625bd0
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/drivers/3d
lib/vulkan/loader
lib/vulkan/headers
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

{% block cpp_defines %}
VK_VIDEO_CODEC_OPERATION_ENCODE_H264_BIT_EXT=VK_VIDEO_CODEC_OPERATION_ENCODE_H264_BIT_KHR
VK_VIDEO_CODEC_OPERATION_ENCODE_H265_BIT_EXT=VK_VIDEO_CODEC_OPERATION_ENCODE_H265_BIT_KHR
{% endblock %}
