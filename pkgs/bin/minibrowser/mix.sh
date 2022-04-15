{% extends '//bin/webkitproc/mix.sh' %}

{% block ninja_threads %}14{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_MINIBROWSER=ON
{% endblock %}
