{% extends '//die/py.py' %}

{% block env %}
export OPTFLAGS="-O0 ${OPTFLAGS}"
{% endblock %}
