{% extends '//mix/py.py' %}

{% block env_lib %}
export OPTFLAGS="-O3 ${OPTFLAGS}"
{% endblock %}
