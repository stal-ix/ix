{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/sdk-1.3.239.0.tar.gz
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/sdk-1.3.250.0.tar.gz
sha:17f8683fd8320d5dfebdb22879f26f82c014d320a6a0622118cd298887626295
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
