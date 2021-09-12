{% extends '//dev/build/make/package.sh' %}

{% block deps %}
# bld boot/stage/1/musl boot/stage/2/env
{% endblock %}

{% block patch %}
>lib/fnmatch.c
{% endblock %}
