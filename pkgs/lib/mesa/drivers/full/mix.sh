{% extends '//mix/proxy.sh' %}

{% block lib_deps %}
lib/mesa
{% endblock %}

{% block env_lib %}
export LDFLAGS="-Wl,--whole-archive -lfullgl -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
