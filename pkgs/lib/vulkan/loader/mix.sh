{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/v1.2.202.tar.gz
aeb91767903cbee234bf449f481877c1
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/wayland/mix.sh
lib/vulkan/headers/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config/mix.sh
{% endblock %}

{% block cmake_flags %}
-DBUILD_WSI_XCB_SUPPORT=NO
-DBUILD_WSI_XLIB_SUPPORT=NO
-DBUILD_STATIC_LOADER=YES
{% endblock %}

{% block patch %}
sed -e 's|APPLE AND BUILD_STATIC_LOADER|BUILD_STATIC_LOADER|' \
    -i loader/CMakeLists.txt
{% endblock %}
