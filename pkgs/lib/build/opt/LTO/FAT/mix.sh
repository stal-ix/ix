{% extends '//mix/template/py.py' %}

{% block env %}
export OPTFLAGS="-flto ${OPTFLAGS}"
{% endblock %}
