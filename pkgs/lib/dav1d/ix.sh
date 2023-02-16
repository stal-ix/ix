{% extends 't/ix.sh' %}

{% block meson_flags %}
enable_tools=false
{{super()}}
{% endblock %}
