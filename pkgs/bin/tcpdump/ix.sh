{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
tcpdump
{% endblock %}

{% block version %}
4.99.7
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/tcpdump-{{self.version().strip()}}.tar.gz
8be364e28d3b745ef1459b385cd2f4bc0e1ebad7a5d2ebdf70071d6c9b5b9a54
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcap
{% endblock %}
