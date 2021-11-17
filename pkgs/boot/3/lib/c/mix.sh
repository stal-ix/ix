{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
{{'boot/3/lib/musl/mix.sh' | linux}}
{% endblock %}
