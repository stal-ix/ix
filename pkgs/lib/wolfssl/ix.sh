{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.6.0-stable.tar.gz
sha:c1e689e21a17aa9b838e67a37c3eadfa578c8e260f8c77fb028c0316309f0636
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
{% endblock %}

{% block env %}
export COFLAGS="--with-wolfssl=${out} \${COFLAGS}"
export WOLFSSL_HEADERS=${out}/include/wolfssl
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
