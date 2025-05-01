{% extends '//die/env.sh' %}

{% block lib_deps %}
lib/build/opt/sections
{% endblock %}

{% block env %}
export LDFLAGS="-Wl,--gc-sections ${LDFLAGS}"
{% endblock %}
