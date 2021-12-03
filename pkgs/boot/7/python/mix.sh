{% extends '//dev/build/python/mix.sh' %}

{% block bld_libs %}
{{'boot/7/lib/linux/mix.sh' | linux}}
{{'lib/darwin/framework/SystemConfiguration/mix.sh' | darwin}}
boot/7/lib/z/mix.sh
boot/7/lib/compiler_rt/mix.sh
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block autoreconf %}
{% endblock %}
