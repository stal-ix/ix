{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-flto ${CFLAGS}"
{% endblock %}
