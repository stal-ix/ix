{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://secure.nic.cz/files/knot-dns/knot-3.4.5.tar.xz
sha:359af70afafa7ccaa18439a7c1eb35270ff9eece81d0756ae4ca716b1433cb4b
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
