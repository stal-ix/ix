{% extends '//mix/proxy.sh' %}

{% block lib_deps %}
lib/mesa
{% endblock %}

{% block env_lib %}
export LDFLAGS="-lGLESv2 \${LDFLAGS}"
{% endblock %}
