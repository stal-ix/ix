{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-DNDEBUG ${OPTFLAGS}"
{% endblock %}
