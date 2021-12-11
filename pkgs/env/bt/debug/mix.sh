{% extends '//mix/template/py.py' %}

{% block env %}
export OPTFLAGS="-UNDEBUG -O0 -g"
{% endblock %}
