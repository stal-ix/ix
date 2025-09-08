{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tcpreplay
{% endblock %}

{% block version %}
4.5.2
{% endblock %}

{% block fetch %}
https://github.com/appneta/tcpreplay/releases/download/v{{self.version().strip()}}/tcpreplay-{{self.version().strip()}}.tar.xz
2df15bc6d49f96a77617d137049f998193bbae95c1a31b04ca02856a24cbf384
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
