{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.3.204.1.tar.gz
sha:262864053968c217d45b24b89044a7736a32361894743dd6cfe788df258c746c

#https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.2.198.0.tar.gz
#298b70404ee9b6482397125c920d3c6b
{% endblock %}

{% block bld_tool %}
bin/pkg-config
{% endblock %}

{% block cmake_flags %}
SPIRV_HEADERS_ENABLE_EXAMPLES=OFF
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
