{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/sdk-1.3.261.1.tar.gz
sha:f85f0ea57b63750d4ddaf6c8649df781c4777006daa3cd772b01e7b5ed02f3f2
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

{% block build_flags %}
# werror
shut_up
{% endblock %}

{% block patch %}
sed -e 's|APPLE AND BUILD_STATIC_LOADER|BUILD_STATIC_LOADER|' \
    -i loader/CMakeLists.txt
{% endblock %}
