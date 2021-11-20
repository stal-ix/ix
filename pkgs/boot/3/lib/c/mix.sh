{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{{'boot/3/lib/musl/mix.sh' | linux}}
{{'lib/darwin/c/mix.sh' | darwin}}
{% endblock %}
