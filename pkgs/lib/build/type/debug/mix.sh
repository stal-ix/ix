{% extends '//mix/py.py' %}

{% block env_lib %}
export OPTFLAGS="-UNDEBUG -g ${OPTFLAGS}"
{% endblock %}
