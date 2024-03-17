{% extends '//die/env.sh' %}

{% block env %}
export CGO_ENABLED=1
export GO_EXTLINK_ENABLED=1
{% endblock %}
