{% extends '//lib/fribidi/t/mix.sh' %}

{% block meson_flags %}
bin=false
{{super()}}
{% endblock %}
