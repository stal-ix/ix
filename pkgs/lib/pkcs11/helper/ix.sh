{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
pkcs11-helper
{% endblock %}

{% block version %}
1.31.0
{% endblock %}

{% block fetch %}
https://github.com/OpenSC/pkcs11-helper/archive/refs/tags/pkcs11-helper-{{self.version().strip()}}.tar.gz
585e0347892bdf45220b080c9eae9216b461f96369c19be1e4bb6d80a078dc6b
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block configure_flags %}
--disable-crypto-engine-gnutls
--disable-crypto-engine-nss
--disable-crypto-engine-polarssl
--disable-crypto-engine-mbedtls
{% endblock %}
