{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-Tools
{% endblock %}

{% block version %}
1.4.357.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Tools/archive/0d6fd73ca73830ccab5fa1f00ed5ed40124e2c55.zip
00ecb6a31704f9db9f26abc6f588db64221c4697580f405c1eebf9e16e454ee4
{% include '//lib/spirv/headers/ver.sh' %}
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
