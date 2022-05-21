{% extends '//die/py.py' %}

{% block env %}
export OPTFLAGS="-flto ${OPTFLAGS}"
{% endblock %}
