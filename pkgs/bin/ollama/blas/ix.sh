{% extends '//bin/ollama/soft/ix.sh' %}

{% block lib_deps %}
bin/ollama/blas/driver
{{super()}}
{% endblock %}

{% block cpp_defines %}
GGML_USE_BLAS=1
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|_USE_CPU|_USE_CPU_XXX|' \
    -i ml/backend/ggml/ggml/src/ggml.go
{% endblock %}
