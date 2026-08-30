{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
shadowsocks-libev
{% endblock %}

{% block version %}
3.3.6
{% endblock %}

{% block fetch %}
https://github.com/shadowsocks/shadowsocks-libev/releases/download/v{{self.version().strip()}}/shadowsocks-libev-{{self.version().strip()}}.tar.gz
ee83b43b36d6a51cfbee72254b6088d4b625feadf06cc2f0bcb810c8236438a5
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
