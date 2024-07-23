{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://secure.nic.cz/files/knot-dns/knot-3.3.8.tar.xz
sha:498de8338489a625673797f7ecc921fa4490c826afbfa42fa66922b525089e6a
{% endblock %}

{% block lib_deps %}
lib/c
lib/lmdb
lib/gnutls
{% endblock %}

{% block configure_flags %}
--disable-daemon
--disable-modules
--disable-utilities
--disable-fastparser
--disable-documentation
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block setup_target_flags %}
export OPTFLAGS="${OPTFLAGS} -O0"
{% endblock %}

{% block patch %}
# our gnutls does not contain pkcs11 support
find . -name key.c | while read l; do
    sed -e 's|.*gnutls_privkey_export_pkcs11.*|abort();|' -i ${l}
done
{% endblock %}
