{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-faddrsig ${CFLAGS}"
{% endblock %}
