{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.2.198.0.tar.gz
298b70404ee9b6482397125c920d3c6b
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config
{% endblock %}

{% block cmake_flags %}
SPIRV_HEADERS_ENABLE_EXAMPLES=OFF
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
