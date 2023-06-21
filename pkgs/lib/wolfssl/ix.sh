{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.6.3-stable.tar.gz
sha:2e74a397fa797c2902d7467d500de904907666afb4ff80f6464f6efd5afb114a
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
