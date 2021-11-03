{% extends '//lib/cxx/mix.sh' %}

{% block lib_deps %}
boot/stage/8/lib/mix.sh
{% endblock %}

{% block bld_deps %}
{{'boot/lib/linux/mix.sh' | linux}}
boot/final/env/clang/mix.sh
{% endblock %}
