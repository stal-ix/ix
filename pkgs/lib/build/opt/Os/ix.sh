{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-Os ${CFLAGS}"
{% endblock %}
