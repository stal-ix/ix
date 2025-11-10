{% extends '//die/c/autorehell.sh' %}

{% block version %}
7.3
{% endblock %}

{% block pkg_name %}
squid
{% endblock %}

{% block fetch %}
https://github.com/squid-cache/squid/archive/refs/tags/SQUID_{{self.version().strip().replace('.', '_')}}.tar.gz
a1f04c08a06568f16962f4e2855b778bf8bff2f52665cc2510b39097910d7372
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
