{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-O3 ${OPTFLAGS}"
{% endblock %}
