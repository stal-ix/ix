{% extends '//dev/build/make/mix.sh' %}

{% block bld_deps %}
{{'boot/1/musl/mix.sh' | linux}}
boot/2/env/mix.sh
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'linux' %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
