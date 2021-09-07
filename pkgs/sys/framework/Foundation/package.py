{% extends '//util/env.py' %}

{% block env %}
export LDFLAGS="-framework Foundation $LDFLAGS"
{% endblock %}
