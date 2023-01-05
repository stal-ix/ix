{% extends '//die/py.py' %}

{% block env %}
export OPTFLAGS="-faddrsig -ffunction-sections -fdata-sections -Wl,-icf=all ${OPTFLAGS}"
{% endblock %}
