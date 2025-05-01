{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,--gc-sections ${LDFLAGS}"
{% endblock %}
