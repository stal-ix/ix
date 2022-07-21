{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.squid-cache.org/Versions/v5/squid-5.6.tar.xz
sha:38d27338a347597ce0e93d0c3be6e5f66b6750417c474ca87ee0d61bb6d148db
{% endblock %}

{% block bld_libs %}
lib/pam
lib/cap
lib/xml2
lib/nettle
lib/gnutls
lib/openssl
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
