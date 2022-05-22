{% extends '//lib/mpg123/t/ix.sh' %}

{% block patch %}
{{super()}}
cd src/libout123
cat modules/dummy.c >> legacy_module.c
{% endblock %}
