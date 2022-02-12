{% extends '//mix/py.py' %}

{% block env_lib %}
export OPTFLAGS="-flto ${OPTFLAGS}"
{% endblock %}
