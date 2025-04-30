{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-faddrsig -ffunction-sections -fdata-sections ${CFLAGS}"
{% endblock %}
