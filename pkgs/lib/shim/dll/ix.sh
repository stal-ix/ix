{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-l{{dll_name}} ${LDFLAGS}"
{% endblock %}
