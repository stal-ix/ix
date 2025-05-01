{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-O1 ${CFLAGS}"
{% endblock %}
