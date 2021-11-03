{% extends '//lib/cxx/mix.sh' %}

{% block bld_deps %}
{{'boot/stage/7/lib/linux/mix.sh' | linux}}
boot/stage/8/std/env/mix.sh
{% endblock %}
