{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.squid-cache.org/Versions/v6/squid-6.4.tar.xz
sha:5ebbced99b3df21bfcf4d1ec39455dff775a5ff6b9215d9f0339958771a88589
{% endblock %}

{% block bld_libs %}
lib/pam
lib/cap
lib/xml/2
lib/nettle
lib/gnutls
lib/openssl
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
