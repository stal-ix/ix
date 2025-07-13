{% extends '//die/c/autorehell.sh' %}

{% block version %}
7.1
{% endblock %}

{% block pkg_name %}
squid
{% endblock %}

{% block fetch %}
https://github.com/squid-cache/squid/archive/refs/tags/SQUID_{{self.version().strip().replace('.', '_')}}.tar.gz
c38a7fd015c73ba52f8010c9a63e4885f4d9d5963e1285aab8fa4d9cadf147d0
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
