{% extends '//lib/tinyalsa/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
utils=enabled
{% endblock %}
