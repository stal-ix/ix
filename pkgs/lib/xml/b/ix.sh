{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
cli=false
{% endblock %}
