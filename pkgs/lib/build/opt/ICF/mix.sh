{% extends '//mix/template/py.py' %}

{% block env %}
export OPTFLAGS="-faddrsig -ffunction-sections -fdata-sections -Wl,-icf=safe ${OPTFLAGS}"
{% endblock %}
