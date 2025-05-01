{% extends '//die/env.sh' %}

{% block lib_deps %}
lib/build/opt/addrsig
{% endblock %}

{% block env %}
export LDFLAGS="-Wl,-icf=safe ${LDFLAGS}"
{% endblock %}
