{% extends '//lib/seat/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
server=disabled
{% endblock %}
