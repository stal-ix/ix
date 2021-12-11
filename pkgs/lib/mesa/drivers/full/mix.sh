{% extends '//mix/template/proxy.sh' %}

{% block lib_deps %}
lib/mesa/mix.sh
{% endblock %}

{% block env %}
export LDFLAGS="-Wl,--whole-archive -lfullgl -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
