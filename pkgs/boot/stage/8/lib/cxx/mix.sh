{% extends '//lib/cxx/mix.sh' %}

{% block bld_deps %}
{{'boot/stage/7/lib/linux/mix.sh' | linux}}
boot/stage/7/cmake/mix.sh
boot/stage/7/python/mix.sh
boot/stage/8/env/std/mix.sh
{% endblock %}
