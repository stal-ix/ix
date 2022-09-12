{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.66.tar.gz
sha:558178704d1aa5f6883aac6cc5d6bbf2a5714c8a0d2e91da0392468cee9f579c
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/openssl
{% endblock %}
