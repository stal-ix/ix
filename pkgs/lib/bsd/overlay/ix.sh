{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/bsd
{% endblock %}

{% block env %}
export CPPFLAGS="-I${BSD_HEADERS} -DLIBBSD_OVERLAY=1 \${CPPFLAGS}"
{% endblock %}
