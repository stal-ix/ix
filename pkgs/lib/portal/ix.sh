{% extends 't/ix.sh' %}

# check bin/elementary/files bin/elementary/screenshot

{% block meson_flags %}
{{super()}}
vapi=false
introspection=false
{% endblock %}
