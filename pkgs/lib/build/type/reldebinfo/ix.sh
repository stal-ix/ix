{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-DNDEBUG -g ${OPTFLAGS}"
{% endblock %}
