{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.6.0-stable.tar.gz
sha:c1e689e21a17aa9b838e67a37c3eadfa578c8e260f8c77fb028c0316309f0636
#https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.5.1-stable.tar.gz
#sha:97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c51375a6dee3
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
