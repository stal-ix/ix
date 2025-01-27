{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-Wno-gnu-include-next ${CFLAGS}"
{% endblock %}
