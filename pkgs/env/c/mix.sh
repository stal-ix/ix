{% extends '//mix/template/mix.json' %}

{% block lib_deps %}
lib/c/mix.sh
lib/compiler_rt/mix.sh
{% endblock %}

{% block run_deps %}
dev/lang/clang/mix.sh
{% endblock %}
