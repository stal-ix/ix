{% extends '//die/env.sh' %}

{% block env %}
export COFLAGS="--with-openssl ${COFLAGS}"
{% endblock %}
