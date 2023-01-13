{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-faddrsig -ffunction-sections -fdata-sections -Wl,-icf=all ${OPTFLAGS}"
{% endblock %}
