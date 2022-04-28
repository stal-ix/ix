{% extends '//lib/mpg123/t/mix.sh' %}

{% block patch %}
{{super()}}
cd src/libout123
cat modules/dummy.c >> legacy_module.c
{% endblock %}
