{% extends '//die/env.sh' %}

{% block env %}
export COFLAGS="--disable-nls ${COFLAGS}"
{% endblock %}
