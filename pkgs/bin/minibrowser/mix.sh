{% extends '//lib/webkit/mix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_MINIBROWSER=ON
{% endblock %}
