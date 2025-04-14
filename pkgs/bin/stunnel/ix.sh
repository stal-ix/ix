{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
stunnel
{% endblock %}

{% block version %}
5.74
{% endblock %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-{{self.version().strip()}}.tar.gz
sha:9bef235ab5d24a2a8dff6485dfd782ed235f4407e9bc8716deb383fc80cd6230
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
