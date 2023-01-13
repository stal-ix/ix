{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz
sha:ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcap
{% endblock %}
