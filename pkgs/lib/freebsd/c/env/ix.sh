{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-lc -lm ${LDFLAGS}"
{% endblock %}
