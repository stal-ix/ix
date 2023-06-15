{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/appneta/tcpreplay/releases/download/v4.4.4/tcpreplay-4.4.4.tar.xz
sha:3ff9753cc43bb15e77832cee657e3030dbcdd957fa247e6abacc605689e24051
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/kernel
{% endblock %}

{% block configure_flags %}
--enable-pcapconfig=no
--enable-static-link=yes
{% endblock %}
