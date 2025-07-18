{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gnutls
{% endblock %}

{% block version %}
3.8.10
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-{{self.version().strip()}}.tar.xz
db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/gmp
lib/zstd
lib/idn/2
lib/tasn1
lib/nettle
lib/brotli
lib/unbound
{% if linux %}
lib/seccomp
{% endif %}
{% if darwin %}
lib/darwin/framework/Security
{% endif %}
lib/unistring
{% endblock %}

{% block bld_libs %}
lib/shim/gnu
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
bld/gettext
{% endblock %}

{% block c_rename_symbol %}
# conflict with libunbound
verbose
rawmemchr
{% endblock %}

{% block configure_flags %}
--with-default-trust-store-file=/etc/ssl/cert.pem
{% if darwin %}
--disable-hardware-acceleration
{% endif %}
--disable-tests
--without-p11-kit
--with-zlib=link
--with-zstd=link
--with-brotli=link
{% endblock %}

{% block setup_target_flags %}
export COFLAGS=$(echo ${COFLAGS} | sed -e 's|zstd=|xxx=|')
{% endblock %}
