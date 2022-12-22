{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v5.5.4-stable.tar.gz
sha:b7ee150e49def77c765bc02aac92ddeb0bebefd4cb12aa263d8f95e405221fb8
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
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
