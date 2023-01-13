{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-flto ${OPTFLAGS}"
{% endblock %}
