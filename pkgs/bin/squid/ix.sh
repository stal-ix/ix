{% extends '//die/c/autorehell.sh' %}

{% block version %}
7.2
{% endblock %}

{% block pkg_name %}
squid
{% endblock %}

{% block fetch %}
https://github.com/squid-cache/squid/archive/refs/tags/SQUID_{{self.version().strip().replace('.', '_')}}.tar.gz
c7f68c5c27e80c734747cdc99dc01ff3f8642532f5eda3276ef0ecb7d515083d
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
