{% extends '//mix/template/py.py' %}

{% block env_lib %}
export OPTFLAGS="-UNDEBUG -g ${OPTFLAGS}"
{% endblock %}
