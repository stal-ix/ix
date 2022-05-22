{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/bsd
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${lib_bsd}/include/bsd -DLIBBSD_OVERLAY=1 \${CPPFLAGS}"
{% endblock %}
