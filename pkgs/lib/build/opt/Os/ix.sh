{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-Os ${OPTFLAGS}"
{% endblock %}
