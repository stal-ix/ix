{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.70.tar.gz
sha:7bbc7b9e9a988d76301325db4c110ec360a98ffb8a221c7accbff9c0a8bae2f3
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
