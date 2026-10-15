{% extends '//die/env.sh' %}

{% block lib_deps %}
lib/darwin/c
{% endblock %}

{% block env %}
{% set framework %}
{% block framework %}
{% endblock %}
{% endset %}

export LDFLAGS="-framework {{framework.strip()}} ${LDFLAGS}"
{% endblock %}
