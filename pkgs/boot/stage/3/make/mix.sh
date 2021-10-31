{% extends '//dev/build/make/mix.sh' %}

{% block deps %}
# bld {{'boot/stage/1/musl/package.py' | linux}}
# bld boot/stage/2/env/mix.sh
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'linux' %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
