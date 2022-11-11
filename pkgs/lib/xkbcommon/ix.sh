{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
enable-tools=false
{% endblock %}
