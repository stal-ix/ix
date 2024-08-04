{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
vapigen=false
introspection=false
{% endblock %}
