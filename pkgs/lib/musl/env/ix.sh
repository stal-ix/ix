{% extends '//die/env.sh' %}

{% block env %}
export CPPFLAGS="-D__STDC_ISO_10646__=201505L ${CPPFLAGS}"
{% endblock %}
