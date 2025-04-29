{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-faddrsig -ffunction-sections -fdata-sections ${OPTFLAGS}"
{% endblock %}
