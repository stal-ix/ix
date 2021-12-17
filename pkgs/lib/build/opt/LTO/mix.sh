{% extends '//mix/template/py.py' %}

{% block env %}
export OPTFLAGS="-flto=thin ${OPTFLAGS}"
{% endblock %}
