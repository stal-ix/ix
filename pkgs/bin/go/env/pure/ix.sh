{% extends '//die/env.sh' %}

{% block env %}
export CGO_ENABLED=0
export GO_EXTLINK_ENABLED=0
{% endblock %}
