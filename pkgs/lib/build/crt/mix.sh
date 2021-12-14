{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/c/mix.sh
lib/compiler_rt/builtins/mix.sh
{% endblock %}

{% block ind_deps %}
lib/build/crt/mix.sh
{% endblock %}
