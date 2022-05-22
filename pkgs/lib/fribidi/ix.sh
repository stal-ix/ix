{% extends '//lib/fribidi/t/ix.sh' %}

{% block meson_flags %}
bin=false
{{super()}}
{% endblock %}
