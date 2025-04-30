{% extends '//die/env.sh' %}

{% block env %}
export CPPFLAGS="-DNDEBUG ${CPPFLAGS}"
export CFLAGS="-g ${CFLAGS}"
{% endblock %}
