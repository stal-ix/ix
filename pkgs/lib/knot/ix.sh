{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
knot
{% endblock %}

{% block version %}
3.4.8
{% endblock %}

{% block fetch %}
https://secure.nic.cz/files/knot-dns/knot-{{self.version().strip()}}.tar.xz
6730a73dbfc12d79d8000ffe22d36d068b7467e74bee1eb122ac4935ecea49f9
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
