{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Tools
{% endblock %}

{% block version %}
1.4.313.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Tools/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
sha:6b88045c8cad7bd042e202826d8b597c657b9a422ca1f89fc3b0ab2dd64c5a0f
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
