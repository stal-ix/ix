{% extends '//mix/py.py' %}

{% block env_lib %}
export OPTFLAGS="-faddrsig -ffunction-sections -fdata-sections -Wl,-icf=safe ${OPTFLAGS}"
{% endblock %}
