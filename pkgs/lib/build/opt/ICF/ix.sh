{% extends '//die/env.sh' %}

{% block env %}
export OPTFLAGS="-Wl,-icf=safe ${OPTFLAGS}"
{% endblock %}
