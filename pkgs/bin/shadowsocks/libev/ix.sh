{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
shadowsocks-libev
{% endblock %}

{% block version %}
3.3.5
{% endblock %}

{% block fetch %}
https://github.com/shadowsocks/shadowsocks-libev/releases/download/v{{self.version().strip()}}/shadowsocks-libev-{{self.version().strip()}}.tar.gz
sha:cfc8eded35360f4b67e18dc447b0c00cddb29cc57a3cec48b135e5fb87433488
{% endblock %}

{% block bld_libs %}
lib/c
lib/ev
lib/pcre
lib/kernel
lib/c/ares
lib/sodium
lib/mbedtls/2
{% endblock %}

{% block configure_flags %}
--disable-documentation
{% endblock %}
