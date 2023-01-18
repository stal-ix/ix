{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.isc.org/isc-projects/bind9/-/archive/v9_19_2/bind9-v9_19_2.tar.bz2
sha:24cb1143542b0a0e75767fa10db5e9cf09aa38b027f02c8b76ea7548f01b88d9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/uv
lib/icu
lib/cap
lib/lmdb
lib/edit
lib/xml/2
lib/idn/2
lib/cmocka
lib/json/c
lib/openssl
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block configure_flags %}
--disable-doh
--enable-developer
{% endblock %}

{% block configure %}
{{super()}}
find . -type f -name Makefile | while read l; do
    sed -e 's|none required||g' -i ${l}
done
{% endblock %}
