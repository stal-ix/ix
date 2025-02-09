{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,--error-limit=0 ${LDFLAGS}"
{% endblock %}
