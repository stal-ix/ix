{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Tools
{% endblock %}

{% block version %}
1.4.321.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
f897f76b1fae6b85b567ee86d7bc1ba6f5b1a13d3bfa5fe0f07fdb81609f7b75
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
WAYLAND_CODE_PROTOCOL=${WCP}
{% endblock %}

{% block patch %}
sed -e 's|.*set.*WAYLAND_CODE_PROTO.*||' -i cube/CMakeLists.txt
sed -e 's|.*WAYLAND_LIBRARY=.*||' -i cube/CMakeLists.txt
{% endblock %}

{% block setup_target_flags %}
export WCP=$(dirname $(dirname $(which wayland-scanner)))/share/wayland/wayland.xml
test -f ${WCP}
{% endblock %}
