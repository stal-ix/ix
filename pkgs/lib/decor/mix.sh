{% extends '//lib/decor/t/mix.sh' %}

{% block lib_deps %}
lib/decor/cairo
{{super()}}
{% endblock %}

{% block patch %}
>src/libdecor-fallback.c
{{super()}}
{% endblock %}
