{% extends '//mix/template/py.py' %}

{% block env %}
export OPTFLAGS="-DNDEBUG -O2"
{% endblock %}
