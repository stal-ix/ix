{% extends '//mix/py.py' %}

{% block env %}
export OPTFLAGS="-DNDEBUG -g ${OPTFLAGS}"
{% endblock %}
