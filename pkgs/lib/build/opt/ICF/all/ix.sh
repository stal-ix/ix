{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,-icf=all ${LDFLAGS}"
{% endblock %}
