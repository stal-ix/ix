{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-O3 ${CFLAGS}"
{% endblock %}
