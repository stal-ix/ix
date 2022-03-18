{% extends '//lib/mesa/t/mix.sh' %}

{% block meson_flags %}
{{super()}}
tools=glsl
{% endblock %}
