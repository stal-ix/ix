{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.squid-cache.org/Versions/v6/squid-6.5.tar.xz
sha:5070f8a3ae6666870c8fc716326befb0a1abe8b5ff3a6f3932cbc5543d7c8549
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

{% block patch %}
find . -name '*.cc' | while read l; do
    sed -e 's|xmlErrorPtr error =|auto error =|' -i ${l}
done
{% endblock %}
