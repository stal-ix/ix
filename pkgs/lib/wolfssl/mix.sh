{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.0.0-stable.tar.gz
d2044f756db0853dd2da0a90dd42ab62
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/71
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh autogen.sh
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
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
