{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-O1 ${OPTFLAGS}"
{% endblock %}
