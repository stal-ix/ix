{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tcpreplay
{% endblock %}

{% block version %}
4.5.1
{% endblock %}

{% block fetch %}
https://github.com/appneta/tcpreplay/releases/download/v{{self.version().strip()}}/tcpreplay-{{self.version().strip()}}.tar.xz
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
