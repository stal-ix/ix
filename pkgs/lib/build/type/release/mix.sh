{% extends '//mix/py.py' %}

{% block env_lib %}
export OPTFLAGS="-DNDEBUG ${OPTFLAGS}"
{% endblock %}
