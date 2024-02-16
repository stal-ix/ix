{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/vulkan-sdk-1.3.275.0.zip
sha:ab2c284ce1d27143afb55e5ea52ba08b35d13e6f2ebec6a37e2e92ac7f1c76d0
{% include '//lib/vulkan/spirv/headers/ver.sh' %}
{% endblock %}

{% block unpack %}
extract1 ${src}/*zip

(
    cd external
    extract 0 ${src}/*gz
    ln -s S* spirv-headers
)
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
SPIRV_COLOR_TERMINAL=ON
SPIRV_WERROR=OFF
SPIRV_SKIP_TESTS=YES
SPIRV_TOOLS_BUILD_STATIC=ON
SPIRV_TOOLS_LIBRARY_TYPE=STATIC
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
rm libSPIRV-Tools-shared.a
ln -s libSPIRV-Tools.a libSPIRV-Tools-shared.a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
