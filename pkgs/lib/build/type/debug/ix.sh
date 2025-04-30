{% extends '//die/env.sh' %}

{% block env %}
export CPPFLAGS="-UNDEBUG ${CPPFLAGS}"
export CFLAGS="-g ${CFLAGS}"
{% endblock %}
