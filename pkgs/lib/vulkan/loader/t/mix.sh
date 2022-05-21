{% extends '//die/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/sdk-1.3.204.1.tar.gz
#sha:5dcd42b564804f4c01891ddd429a4a5028113c4cf39b44256689e8f543773134
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/sdk-1.3.211.0.tar.gz
sha:bb42a8e0dda103f98bddb9ae2311ae8e8e988588b600a1114b74a1ba3a0843f4
{% endblock %}

{% block lib_deps %}
lib/c
lib/wayland
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cmake_flags %}
BUILD_WSI_XCB_SUPPORT=NO
BUILD_WSI_XLIB_SUPPORT=NO
BUILD_STATIC_LOADER=YES
{% endblock %}

{% block patch %}
sed -e 's|APPLE AND BUILD_STATIC_LOADER|BUILD_STATIC_LOADER|' \
    -i loader/CMakeLists.txt
{% endblock %}
