{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://secure.nic.cz/files/knot-dns/knot-3.3.3.tar.xz
sha:aab40aab2acd735c500f296bacaa5c84ff0488221a4068ce9946e973beacc5ae
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

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O0"
{% endblock %}

{% block patch %}
# our gnutls does not contain pkcs11 support
find . -name key.c | while read l; do
    sed -e 's|.*gnutls_privkey_export_pkcs11.*|abort();|' -i ${l}
done
{% endblock %}
