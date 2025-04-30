{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-O2 ${CFLAGS}"
{% endblock %}
