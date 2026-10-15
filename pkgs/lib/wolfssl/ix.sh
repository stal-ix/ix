{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
wolfssl
{% endblock %}

{% block version %}
5.9.4
{% endblock %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v{{self.version().strip()}}-stable.tar.gz
7256bfc89b183a75183806c7debfa203443873b0b4a562e1b80d68e01b45ac57
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
