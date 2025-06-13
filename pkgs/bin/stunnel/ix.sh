{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
stunnel
{% endblock %}

{% block version %}
5.75
{% endblock %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-{{self.version().strip()}}.tar.gz
0c1ef0ed85240974dccb94fe74fb92d6383474c7c0d10e8796d1f781a3ba5683
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
