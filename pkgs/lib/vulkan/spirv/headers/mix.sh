{% extends '//mix/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.3.204.1.tar.gz
#sha:262864053968c217d45b24b89044a7736a32361894743dd6cfe788df258c746c
https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-1.3.211.0.tar.gz
sha:30a78e61bd812c75e09fdc7a319af206b1044536326bc3e85fea818376a12568
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cmake_flags %}
SPIRV_HEADERS_ENABLE_EXAMPLES=OFF
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share ${out}/lib
{% endblock %}
