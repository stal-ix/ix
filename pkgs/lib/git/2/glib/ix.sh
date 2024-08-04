{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
introspection=false
vapi=false
{% endblock %}
