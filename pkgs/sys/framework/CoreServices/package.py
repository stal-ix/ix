{% extends '//mix/template/env.py' %}

{% block env %}
export LDFLAGS="-framework CoreServices $LDFLAGS"
{% endblock %}
