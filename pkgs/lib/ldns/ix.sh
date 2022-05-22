{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/ldns/archive/refs/tags/1.8.1.tar.gz
sha:5736a61dbc1aaf64d4dc235643d00c5c265d988cfc2e7e89c770cd867bdb081b
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block configure_flags %}
--with-drill
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-ldns=${out} \${COFLAGS}"
{% endblock %}
