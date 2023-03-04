{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.69.tar.gz
sha:1ff7d9f30884c75b98c8a0a4e1534fa79adcada2322635e6787337b4e38fdb81
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
