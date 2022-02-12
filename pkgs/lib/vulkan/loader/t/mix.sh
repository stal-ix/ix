{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/v1.2.202.tar.gz
aeb91767903cbee234bf449f481877c1
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
