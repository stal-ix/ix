{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-UNDEBUG ${CFLAGS}"
{% endblock %}
