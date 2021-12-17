{% extends '//mix/template/py.py' %}

{% block env %}
export OPTFLAGS="--xxx -function-sections -fdata-sections -Wl,-icf=safe ${OPTFLAGS}"
{% endblock %}
