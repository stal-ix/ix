{% extends '//lib/evdev/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
tools=enabled
{% endblock %}

