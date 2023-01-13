{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-UNDEBUG -g ${OPTFLAGS}"
{% endblock %}
