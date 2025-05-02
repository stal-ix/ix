{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-ffunction-sections -fdata-sections ${CFLAGS}"
{% endblock %}
