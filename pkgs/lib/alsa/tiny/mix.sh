{% extends '//lib/alsa/tiny/t/mix.sh' %}

{% block meson_flags %}
{{super()}}
utils=disabled
{% endblock %}
