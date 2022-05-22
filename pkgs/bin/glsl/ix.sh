{% extends '//lib/mesa/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
tools=glsl
{% endblock %}
