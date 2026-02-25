{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
knot
{% endblock %}

{% block version %}
3.5.3
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-dns/knot-{{self.version().strip()}}.tar.xz
e003ad1eef229c4e65a6cac876ee773e25a06177ecdc83795a26617a6eebe471
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
export CFLAGS="${CFLAGS} -O0"
{% endblock %}

{% block patch %}
# our gnutls does not contain pkcs11 support
find . -name key.c | while read l; do
    sed -e 's|.*gnutls_privkey_export_pkcs11.*|abort();|' -i ${l}
done
{% endblock %}
