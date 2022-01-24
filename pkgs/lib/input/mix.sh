{% extends '//lib/input/t/mix.sh' %}

{% block meson_flags %}
debug-gui=false
{{super()}}
{% endblock %}
