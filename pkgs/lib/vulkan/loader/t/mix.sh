{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/sdk-1.3.204.1.tar.gz
sha:5dcd42b564804f4c01891ddd429a4a5028113c4cf39b44256689e8f543773134
{% endblock %}

{% block lib_deps %}
lib/c
lib/wayland
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bin/pkg-config
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
