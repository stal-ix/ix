{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
knot
{% endblock %}

{% block version %}
3.5.2
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-dns/knot-{{self.version().strip()}}.tar.xz
6f577c247ef870a55fe3377246bc1c2d643c673cd32de6c26231ff51d3fc7093
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
