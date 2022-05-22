{% extends '//bin/webkitproc/ix.sh' %}

{% block ninja_threads %}14{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_MINIBROWSER=ON
{% endblock %}
