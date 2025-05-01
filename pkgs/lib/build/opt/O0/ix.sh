{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-O0 ${CFLAGS}"
{% endblock %}
