{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.71.tar.gz
sha:f023aae837c2d32deb920831a5ee1081e11c78a5d57340f8e6f0829f031017f5
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
