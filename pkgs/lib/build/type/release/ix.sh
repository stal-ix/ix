{% extends '//die/env.sh' %}

{% block env %}
export CPPFLAGS="-DNDEBUG ${CPPFLAGS}"
{% endblock %}
