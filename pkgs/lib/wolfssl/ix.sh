{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.6.4-stable.tar.gz
sha:031691906794ff45e1e792561cf31759f5d29ac74936bc8dffb8b14f16d820b4
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block configure_flags %}
--enable-all
--enable-opensslextra
--enable-opensslall
--enable-base64encode
--enable-pkcs11
--enable-reproducible-build
--enable-tls13
--enable-curl
{% endblock %}

{% block env %}
export CPPFLAGS="-DOPENSSL_EXTRA=1 -DOPENSSL_ALL=1 -DHAVE_ECC=1 \${CPPFLAGS}"
export COFLAGS="--with-wolfssl=${out} \${COFLAGS}"
export WOLFSSL_HEADERS=${out}/include/wolfssl
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
# colrm
bin/util/linux
{% endblock %}
