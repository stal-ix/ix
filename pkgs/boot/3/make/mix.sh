{% extends '//dev/build/make/mix.sh' %}

{% block bld_libs %}
{{'boot/1/musl/mix.sh' | linux}}
{% endblock %}

{% block bld_deps %}
boot/2/env/mix.sh
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'linux' %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
