{% extends '//die/gen.sh' %}

{% block lib_deps %}
lib/mesa
{% endblock %}

{% block env %}
export LDFLAGS="-lEGL \${LDFLAGS}"
{% endblock %}
