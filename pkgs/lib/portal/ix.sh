{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
vapi=false
introspection=false
{% endblock %}
