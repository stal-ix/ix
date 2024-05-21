{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-march=armv7 ${CFLAGS}"
{% if hard_float %}
export CFLAGS="-mfloat-abi=hard ${CFLAGS}"
{% else %}
export CFLAGS="-mfloat-abi=soft ${CFLAGS}"
{% endif %}
{% endblock %}
