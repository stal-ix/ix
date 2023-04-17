{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.isc.org/isc-projects/bind9/-/archive/v9_19_11/bind9-v9_19_11.tar.bz2
sha:7903d0d1aed57605d9049f85010ccf0782f1298357fa4148cc2d18b2cc8f0131
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
lib/ng/http/2
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block configure_flags %}
--enable-developer
--disable-warn-error
--with-libnghttp2=yes
{% endblock %}

{% block configure %}
{{super()}}
find . -type f -name Makefile | while read l; do
    sed -e 's|none required||g' -i ${l}
done
{% endblock %}
