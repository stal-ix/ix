{% extends '//dev/build/make/package.sh' %}

{% block deps %}
# bld {{'boot/stage/1/musl/package.py' | linux}}
# bld boot/stage/2/env/package.sh
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'linux' %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
