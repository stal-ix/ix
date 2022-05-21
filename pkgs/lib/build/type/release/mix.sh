{% extends '//die/py.py' %}

{% block env %}
export OPTFLAGS="-DNDEBUG ${OPTFLAGS}"
{% endblock %}
