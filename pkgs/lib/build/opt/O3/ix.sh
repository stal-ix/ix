{% extends '//die/py.py' %}

{% block env %}
export OPTFLAGS="-O3 ${OPTFLAGS}"
{% endblock %}
