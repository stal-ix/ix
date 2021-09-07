{% extends '//util/env.py' %}

{% block env %}
export CFLAGS="-fcolor-diagnostics $CFLAGS"
export CXXFLAGS="-fcolor-diagnostics $CXXFLAGS"
export LDFLAGS="-fcolor-diagnostics $LDFLAGS"
{% endblock %}
