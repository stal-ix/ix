{% extends '//lib/clc/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/20/ver.sh' %}
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/llvm/20
{% endblock %}
