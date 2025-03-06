{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,--allow-multiple-definition ${LDFLAGS}"
{% endblock %}
