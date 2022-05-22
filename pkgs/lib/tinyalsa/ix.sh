{% extends '//lib/tinyalsa/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
utils=disabled
{% endblock %}
