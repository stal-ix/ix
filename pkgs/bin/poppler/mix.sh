{% extends '//lib/poppler/t/mix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_UTILS=ON
{% endblock %}
