{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
daemon=false
{% endblock %}
