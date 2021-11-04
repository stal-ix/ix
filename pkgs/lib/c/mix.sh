{% extends '//mix/template/hub.sh' %}

{% block deps %}
{{'lib/musl/mix.sh lib/mimalloc/mix.sh' | linux}}
{% endblock %}
