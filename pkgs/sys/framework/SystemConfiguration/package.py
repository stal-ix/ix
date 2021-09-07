{% extends '//util/env.py' %}

{% block env %}
export LDFLAGS="-framework SystemConfiguration $LDFLAGS"
{% endblock %}
