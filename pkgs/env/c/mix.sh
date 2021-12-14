{% extends '//mix/template/hub.sh' %}

{% block ind_deps %}
lib/c/mix.sh
lib/compiler_rt/builtins/mix.sh
{% endblock %}

{% block run_deps %}
env/c/{{cc or 'bsd'}}/mix.sh
{% endblock %}
