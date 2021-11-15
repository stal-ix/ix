{% extends '//mix/template/lib.sh' %}

{% block deps %}
{{'boot/8/lib/musl/mix.sh boot/8/lib/mimalloc/mix.sh' | linux}}
{% endblock %}
