{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/refs/tags/sdk-1.2.198.0.tar.gz
#b19041a161edcbba9ea4e2fb9eb4cfa0
https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/3dfeacfe0ad07415a4cac3122f07991688d97a2a.zip
57b193272998cdd0563ebc0064a36fe5
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
lib/wayland/mix.sh
lib/robin/hood/mix.sh
lib/vulkan/headers/mix.sh
lib/vulkan/spirv/headers/mix.sh
lib/vulkan/spirv/tools/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/python/mix.sh
dev/build/pkg-config/mix.sh
lib/vulkan/spirv/tools/mix.sh
{% endblock %}

{% block cmake_flags %}
-DBUILD_WERROR=OFF
-DBUILD_WSI_XCB_SUPPORT=OFF
-DBUILD_WSI_XLIB_SUPPORT=OFF
-DBUILD_WSI_WAYLAND_SUPPORT=ON
{% endblock %}

{% block patch %}
find . | grep CMakeLists.txt | while read l; do
    sed -e 's|SHARED|STATIC|' -i ${l}
done
{% endblock %}
