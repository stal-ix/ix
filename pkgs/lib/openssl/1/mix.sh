{% extends '//lib/openssl/template.sh' %}

{% block fetch %}
https://www.openssl.org/source/old/1.1.1/openssl-1.1.1j.tar.gz
cccaa064ed860a2b4d1303811bf5c682
{% endblock %}

{% block openssl_conf_opts %}
no-hw
{% endblock %}
