{% extends '//die/c/autorehell.sh' %}

{% block version %}
7.8
{% endblock %}

{% block pkg_name %}
squid
{% endblock %}

{% block fetch %}
https://github.com/squid-cache/squid/archive/refs/tags/SQUID_{{self.version().strip().replace('.', '_')}}.tar.gz
90af720d26cd99aa34e968aa1b875586d11b02faa0e5c70666f4cf311d7ba333
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
sed -e '/#define SquidMD5Final.*md5_digest/s|, MD5_DIGEST_SIZE||' \
    -i include/md5.h
{% endblock %}
