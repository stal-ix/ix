{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.8.tar.xz
sha:ac4f020e583880b51380ed226e59033244bc536cad2623f2e26f5afa2939d8fb
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
