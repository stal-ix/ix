{% extends '//mix/template/py.py' %}

{% block env %}
export CFLAGS="-fdiagnostics-color ${CFLAGS}"
export CXXFLAGS="-nostdinc++ -fdiagnostics-color ${CXXFLAGS}"
export LDFLAGS="-fdiagnostics-color ${LDFLAGS}"
{% endblock %}
