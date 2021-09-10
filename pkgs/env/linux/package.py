{% extends '//util/env.py' %}

{% block env %}
export CFLAGS="-fPIC $CFLAGS"
{% endblock %}
