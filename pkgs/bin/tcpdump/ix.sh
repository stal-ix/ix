{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.tcpdump.org/release/tcpdump-4.99.2.tar.gz
sha:f4304357d34b79d46f4e17e654f1f91f9ce4e3d5608a1badbd53295a26fb44d5
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcap
{% endblock %}
