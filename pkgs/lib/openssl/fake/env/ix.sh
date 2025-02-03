{% extends '//die/env.sh' %}

{% block env %}
export COFLAGS="--disable-openssl ${COFLAGS}"
{% endblock %}
