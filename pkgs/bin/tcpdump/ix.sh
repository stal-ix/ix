{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
tcpdump
{% endblock %}

{% block version %}
4.99.6
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/tcpdump-{{self.version().strip()}}.tar.gz
5839921a0f67d7d8fa3dacd9cd41e44c89ccb867e8a6db216d62628c7fd14b09
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcap
{% endblock %}
