{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-O0 ${OPTFLAGS}"
{% endblock %}
