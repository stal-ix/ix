{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bind9
{% endblock %}

{% block version %}
9.20.15
{% endblock %}

{% block fetch %}
https://gitlab.isc.org/isc-projects/bind9/-/archive/v{{self.version().strip()}}/bind9-v{{self.version().strip()}}.tar.bz2?ref_type=tags
ec7428012642cef4e3f5df26088b57d9c05474ba132da06cba7c4170969c695e
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
