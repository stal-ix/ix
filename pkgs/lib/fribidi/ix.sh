{% extends 't/ix.sh' %}

{% block meson_flags %}
bin=false
{{super()}}
{% endblock %}
