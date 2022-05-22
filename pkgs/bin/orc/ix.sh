{% extends '//lib/orc/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
tools=enabled
{% endblock %}
