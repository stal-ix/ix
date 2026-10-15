{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
{% if wasi %}
lib/shim/setjmp
{% endif %}
{% endblock %}

{% block cmake_flags %}
ENABLE_APPS=OFF
ENABLE_TOOLS=OFF
ENABLE_EXAMPLES=OFF
{{super()}}
{% if wasi %}
CONFIG_AV1_ENCODER=0
CONFIG_MULTITHREAD=0
CONFIG_RUNTIME_CPU_DETECT=0
CONFIG_WEBM_IO=0
CONFIG_LIBYUV=0
AOM_TARGET_CPU=generic
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|//.*/|/|' -i ${out}/lib/pkgconfig/aom.pc
{% endblock %}
