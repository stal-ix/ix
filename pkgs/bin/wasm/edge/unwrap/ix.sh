{% extends '//bin/wasm/edge/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
WASMEDGE_USE_LLVM=OFF
WASMEDGE_BUILD_AOT_RUNTIME=OFF
{% endblock %}
