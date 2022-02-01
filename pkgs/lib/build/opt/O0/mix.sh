{% extends '//mix/template/py.py' %}

{% block env_lib %}
export OPTFLAGS="-O0 ${OPTFLAGS}"
{% endblock %}
