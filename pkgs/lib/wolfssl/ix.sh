{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.7.2-stable.tar.gz
sha:0f2ed82e345b833242705bbc4b08a2a2037a33f7bf9c610efae6464f6b10e305
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
