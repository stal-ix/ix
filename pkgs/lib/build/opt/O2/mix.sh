{% extends '//mix/py.py' %}

{% block env_lib %}
export OPTFLAGS="-O2 ${OPTFLAGS}"
{% endblock %}
