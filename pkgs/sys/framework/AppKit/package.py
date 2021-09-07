{% extends '//util/env.py' %}

{% block env %}
export LDFLAGS="-framework AppKit $LDFLAGS"
{% endblock %}
