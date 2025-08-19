{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
doc=disabled
tools=disabled
tests=disabled
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}
