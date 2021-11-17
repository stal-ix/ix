{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{{'boot/8/lib/musl/mix.sh boot/8/lib/mimalloc/mix.sh' | linux}}
{% endblock %}
