{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
{{'boot/1/musl/mix.sh' | linux}}
boot/0/env/mix.sh
{% endblock %}
