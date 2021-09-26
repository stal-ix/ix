{% extends '//dev/build/make/package.sh' %}

{% block deps %}
# bld {{'boot/stage/1/musl' | linux}} boot/stage/2/env
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'linux' %}
>lib/fnmatch.c
{% endif %}
{% endblock %}
