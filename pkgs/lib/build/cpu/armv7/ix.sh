{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-mcpu=cortex-a53 -march=armv7 -mfloat-abi=hard ${CFLAGS}"
{% endblock %}
