{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://www.squid-cache.org/Versions/v6/squid-6.6.tar.xz
sha:55bd7f9f4898153161ea1228998acb551bf840832b9e5b90fc8ecd2942420318
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
