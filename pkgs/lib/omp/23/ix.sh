{% extends '//lib/omp/t/ix.sh' %}

{% block openmp_standalone_build %}OFF{% endblock %}

{% block fetch %}
{% include '//lib/llvm/23/ver.sh' %}
{% endblock %}
