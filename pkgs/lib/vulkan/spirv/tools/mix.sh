{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v2022.1.tar.gz
sha:844c0f590a0ab9237cec947e27cfc75bd14f39a68fc3b37d8f1b9e1b21490a58

https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.3.204.1.tar.gz
sha:262864053968c217d45b24b89044a7736a32361894743dd6cfe788df258c746c

#https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/v2021.4.tar.gz
#bb36f699fcaca7362b983d75fa5a547b
#https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.2.198.0.tar.gz
#298b70404ee9b6482397125c920d3c6b
{% endblock %}

{% block unpack %}
extract1 ${src}/v*

(
    cd external
    extract0 ${src}/sdk*
    ln -s S* SPIRV-Headers
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
cd ${out}/lib && rm libSPIRV-Tools-shared.a && ln -s libSPIRV-Tools.a libSPIRV-Tools-shared.a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
