{% extends '//die/py.py' %}

{% block env %}
export OPTFLAGS="-UNDEBUG -g ${OPTFLAGS}"
{% endblock %}
