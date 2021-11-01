{% extends '//mix/template/py.py' %}

{% block env %}
export LDFLAGS="-framework CoreServices ${LDFLAGS}"
{% endblock %}
