{% extends '//lib/poppler/mix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_UTILS=ON
{% endblock %}
