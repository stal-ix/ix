{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
stunnel
{% endblock %}

{% block version %}
5.76
{% endblock %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-{{self.version().strip()}}.tar.gz
cda37eb4d0fb1e129718ed27ad77b5735e899394ce040bb2be28bbb937fd79e1
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
