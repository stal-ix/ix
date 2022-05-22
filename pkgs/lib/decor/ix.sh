{% extends '//lib/decor/t/ix.sh' %}

{% block lib_deps %}
lib/decor/cairo
{{super()}}
{% endblock %}

{% block patch %}
>src/libdecor-fallback.c
{{super()}}
{% endblock %}
