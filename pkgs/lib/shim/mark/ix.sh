{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-L/MARK:{{mark}} ${LDFLAGS}"
{% endblock %}
