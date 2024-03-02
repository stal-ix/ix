{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-UNDEBUG ${OPTFLAGS}"
{% endblock %}
