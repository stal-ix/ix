{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,-z,muldefs ${LDFLAGS}"
{% endblock %}
