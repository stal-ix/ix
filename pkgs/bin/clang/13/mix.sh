{% extends '//bin/clang/t/mix.sh' %}

{% block fetch %}
{% include '//lib/llvm/13/ver.sh' %}
{% endblock %}

{% block env %}
{{super()}}
export CLANG_VERSION=13.0.0
{% endblock %}
