{% extends '//mix/template/py.py' %}

{% block env %}
export LDFLAGS="-framework SystemConfiguration ${LDFLAGS}"
{% endblock %}
