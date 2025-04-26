{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
tcpdump
{% endblock %}

{% block version %}
4.99.5
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/tcpdump-{{self.version().strip()}}.tar.gz
sha:8c75856e00addeeadf70dad67c9ff3dd368536b2b8563abf6854d7c764cd3adb
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcap
{% endblock %}
