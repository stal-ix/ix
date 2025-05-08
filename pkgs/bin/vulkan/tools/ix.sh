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

{#
/bin/sh: 1: Syntax error: Unterminated quoted string
[12/17] Building C object cube/CMakeFiles/vkcubepp.dir/xdg-shell-code.c.o
FAILED: cube/CMakeFiles/vkcubepp.dir/xdg-shell-code.c.o
/ix/build/5WRNyTmhwXpFunzFIVuo75/bin/tc/clang -D/ix/store/TBJ77UQqjyTJd05RMCgjX4-lib-musl-naked-unwrap/lib/libm.a -D/ix/store/TBJ77UQqjyTJd05RMCgjX4-lib-musl-naked-unwrap/lib/librt.a -D/ix/store/ZigkOh6otehFPtORn14wo1-lib-ffi-unix/lib/libffi.a" -DVK_USE_PLATFORM_DISPLAY_KHR -DVK_USE_PLATFORM_WAYLAND_KHR -DWAYLAND_LIBRARY=\"/ix/store/Ug4b9CrlnMVfDZ3p1qmyO3-lib-wayland/lib/libwayland-client.a -I/ix/build/5WRNyTmhwXpFunzFIVuo75/obj/cube -I/ix/build/5WRNyTmhwXpFunzFIVuo75/src/cube/. -O3 -DNDEBUG -std=c99 -fPIE -fvisibility=hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-sign-conversion -Wno-shorten-64-to-32 -Wno-string-conversion -Wno-implicit-int-conversion -Wno-enum-enum-conversion -MD -MT cube/CMakeFiles/vkcubepp.dir/xdg-shell-code.c.o -MF cube/CMakeFiles/vkcubepp.dir/xdg-shell-code.c.o.d -o cube/CMakeFiles/vkcubepp.dir/xdg-shell-code.c.o -c /ix/build/5WRNyTmhwXpFunzFIVuo75/obj/cube/xdg-shell-code.c
#}

{% block patch %}
sed -e 's|.*set.*WAYLAND_CODE_PROTO.*||' -i cube/CMakeLists.txt
{% endblock %}

{% block setup_target_flags %}
export WCP=$(dirname $(dirname $(which wayland-scanner)))/share/wayland/wayland.xml
test -f ${WCP}
{% endblock %}
