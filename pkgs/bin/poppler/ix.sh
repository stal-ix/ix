{% extends '//lib/poppler/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_UTILS=ON
{% endblock %}
