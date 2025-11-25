{% extends '//bin/llama/cpp/soft/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/openblas
{% endblock %}

{% block cmake_flags %}
{{super()}}
GGML_BLAS=ON
GGML_BLAS_VENDOR=OpenBLAS
{% endblock %}
