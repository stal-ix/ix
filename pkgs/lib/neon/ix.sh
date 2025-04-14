{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
neon
{% endblock %}

{% block version %}
0.34.0
{% endblock %}

{% block fetch %}
https://notroj.github.io/neon/neon-{{self.version().strip()}}.tar.gz
sha:2e3ee8535039966c80764f539d5c9bfee1651a17e2f36e5ca462632181253977
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/expat
lib/openssl
{% endblock %}

{% block configure_flags %}
--with-ssl
--with-expat
{% endblock %}
