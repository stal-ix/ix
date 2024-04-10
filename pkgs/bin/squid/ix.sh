{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.squid-cache.org/Versions/v6/squid-6.9.tar.xz
sha:1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882
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
