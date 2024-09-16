{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/squid-cache/squid/archive/refs/tags/SQUID_6_11.tar.gz
sha:9cba250cbd88c41a1bb94d4f6e27c4fd338ffb626fbce7e1ac7064d50409d19c
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
