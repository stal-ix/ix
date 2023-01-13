{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-O2 ${OPTFLAGS}"
{% endblock %}
