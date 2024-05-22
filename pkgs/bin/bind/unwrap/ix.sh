{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/isc-projects/bind9/archive/refs/tags/v9.19.15.tar.gz
0cbbee615e1deb8f1c5e9edfede25dfdc7e3868ae00eb281a5974b2fb5989f6a
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
lib/urcu
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

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block configure_flags %}
--enable-developer
--disable-warn-error
--with-libnghttp2=yes
{% endblock %}

{% block patch %}
sed -e 's|.*SUBD.*tests.*||' -i Makefile.am
sed -e 's|tests||' -e 's|plugins||' -i bin/Makefile.am
{% endblock %}

{% block configure %}
{{super()}}
find . -type f -name Makefile | while read l; do
    sed -e 's|none required||g' -i ${l}
done
{% endblock %}
