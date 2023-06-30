{% extends '//bin/wasm/edge/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/llvm/15/full
{% endblock %}

{% block cmake_flags %}
{{super()}}
WASMEDGE_BUILD_AOT_RUNTIME=ON
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}
