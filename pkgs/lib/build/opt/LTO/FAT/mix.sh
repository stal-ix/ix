{% extends '//mix/template/py.py' %}

{% block env_lib %}
export OPTFLAGS="-flto ${OPTFLAGS}"
{% endblock %}
