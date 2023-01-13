{% extends '//die/env.sh' %}

{% block env %}
export LDFLAGS="-nostdlib -nostdlib++ ${LDFLAGS}"
export CPPFLAGS="-nostdinc -nostdinc++ ${CPPFLAGS}"
{% endblock %}
