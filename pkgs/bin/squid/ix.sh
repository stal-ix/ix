{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/squid-cache/squid/archive/refs/tags/SQUID_6_10.tar.gz
sha:3dd53e22a8f741a2034be31be50c4a30d611fdb6a1f200159b68951296e35718
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
