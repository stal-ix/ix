{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v2021.4.tar.gz
bb36f699fcaca7362b983d75fa5a547b
https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.2.198.0.tar.gz
298b70404ee9b6482397125c920d3c6b
{% endblock %}

{% block unpack %}
extract ${src}/v*
cd S*

(
    cd external
    extract ${src}/sdk*
    ln -s S* SPIRV-Headers
)
{% endblock %}

{% block bld_tool %}
dev/tool/python
{% endblock %}

{% block patch %}
sed -e 's| SHARED | STATIC |' -i source/CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
SPIRV_COLOR_TERMINAL=ON
SPIRV_WERROR=OFF
SPIRV_SKIP_TESTS=YES
SPIRV_TOOLS_BUILD_STATIC=ON
SPIRV_TOOLS_LIBRARY_TYPE=STATIC
BUILD_SHARED_LIBS=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib && rm libSPIRV-Tools-shared.a && ln -s libSPIRV-Tools.a libSPIRV-Tools-shared.a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
