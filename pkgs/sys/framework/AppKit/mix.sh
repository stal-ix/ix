{% extends '//mix/template/py.py' %}

{% block env %}
export LDFLAGS="-framework AppKit ${LDFLAGS}"
{% endblock %}
