{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/appneta/tcpreplay/releases/download/v4.5.1/tcpreplay-4.5.1.tar.xz
sha:5126613f783062b43f514b05ad981376050a8fee35b03c8de4445ddeefd95049
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
