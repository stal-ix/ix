{% extends '//mix/template/py.py' %}

{% block env %}
export CPPFLAGS="-DNDEBUG ${CPPFLAGS}"
export CFLAGS="-O2 ${CFLAGS}"
export CXXFLAGS="-O2 ${CXXFLAGS}"
{% endblock %}
