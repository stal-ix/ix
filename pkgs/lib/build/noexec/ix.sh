{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-Wl,-z,noexecstack -Wl,-z,muldefs ${LDFLAGS}"
{% endblock %}
