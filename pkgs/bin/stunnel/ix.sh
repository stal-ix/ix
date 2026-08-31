{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
stunnel
{% endblock %}

{% block version %}
5.80
{% endblock %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-{{self.version().strip()}}.tar.gz
6d0841d48de07cbbaf4a055919065bf7bb5ebc63cc15c97a2c76caa2bf285513
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
