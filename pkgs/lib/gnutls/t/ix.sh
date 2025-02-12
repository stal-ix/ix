{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.9.tar.xz
sha:69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed
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
