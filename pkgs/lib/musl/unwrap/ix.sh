{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/musl/pure
lib/compiler_rt/builtins
{% endblock %}

{% block env %}
export CPPFLAGS="-D__STDC_ISO_10646__=201505L \${CPPFLAGS}"
{% endblock %}
