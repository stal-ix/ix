{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/mesa
{% endblock %}

{% block env_lib %}
export LDFLAGS="-lEGL \${LDFLAGS}"
{% endblock %}
