{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,-icf=safe ${LDFLAGS}"
{% endblock %}
