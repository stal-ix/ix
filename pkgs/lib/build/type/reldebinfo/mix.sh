{% extends '//mix/py.py' %}

{% block env_lib %}
export OPTFLAGS="-DNDEBUG -g ${OPTFLAGS}"
{% endblock %}
