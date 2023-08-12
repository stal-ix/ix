{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.squid-cache.org/Versions/v6/squid-6.2.tar.xz
sha:dd759e151e997d31786d91743d327b1b4b532f1caea66bf81100ec8ba04ec4c1
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
