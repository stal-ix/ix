{% extends '//lib/iwasm/ix.sh' %}

{% block unpack %}
{{super()}}
cd product-mini/platforms/linux
{% endblock %}

{% block cmake_flags %}
{{super()}}
WAMR_BUILD_INTERP=1
WAMR_BUILD_FAST_INTERP=1
WAMR_BUILD_LIB_PTHREAD=1
WAMR_BUILD_LIB_WASI_THREADS=1
{% endblock %}
