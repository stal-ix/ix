{% extends 't/ix.sh' %}

{% block build_flags %}
{{super()}}
rename_dynlib
{% endblock %}
