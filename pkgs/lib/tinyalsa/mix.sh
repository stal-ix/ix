{% extends '//lib/tinyalsa/t/mix.sh' %}

{% block meson_flags %}
{{super()}}
utils=disabled
{% endblock %}
