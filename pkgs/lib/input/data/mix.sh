{% extends '//lib/input/t/mix.sh' %}

{% block env %}
export INPUT_DATA="${out}"
{% endblock %}

{% block meson_flags %}
debug-gui=false
{{super()}}
{% endblock %}
