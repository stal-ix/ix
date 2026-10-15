{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
stunnel
{% endblock %}

{% block version %}
5.82
{% endblock %}

{% block fetch %}
https://www.stunnel.org/downloads/archive/5.x/stunnel-{{self.version().strip()}}.tar.gz
8e7438ccd6b3a2ab05182d0846e112a56a7f557ecdee40de07bf67820008bef7
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
