{% extends '//bin/ollama/soft/ix.sh' %}

{% block lib_deps %}
bin/ollama/blas/driver
{{super()}}
{% endblock %}

{% block cpp_defines %}
GGML_USE_BLAS=1
{{super()}}
{% endblock %}
