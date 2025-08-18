{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
doc=disabled
tools=disabled
tests=disabled
{% endblock %}
