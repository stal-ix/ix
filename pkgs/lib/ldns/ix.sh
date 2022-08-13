{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/ldns/archive/refs/tags/1.8.2.tar.gz
sha:20e90be1704d35ac28da597595b32af33e8b708af9a8f1ca409d7b418ff2f9e0
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
