{% extends '//lib/seat/ix.sh' %}

{% block meson_flags %}
{{super()}}
server=enabled
{% endblock %}
