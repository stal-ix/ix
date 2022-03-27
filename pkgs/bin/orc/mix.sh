{% extends '//lib/orc/t/mix.sh' %}

{% block meson_flags %}
{{super()}}
tools=enabled
{% endblock %}
