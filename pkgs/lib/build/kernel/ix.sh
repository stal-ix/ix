{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-D__always_inline=__inline__ -w ${CFLAGS}"
{% endblock %}
