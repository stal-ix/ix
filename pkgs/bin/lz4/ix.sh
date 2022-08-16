{% extends '//lib/lz4/t/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}
