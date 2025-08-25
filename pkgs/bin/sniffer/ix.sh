{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sniffer
{% endblock %}

{% block version %}
0.6.3
{% endblock %}

{% block go_url %}
https://github.com/chenjiandongx/sniffer/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fbbcbd160b928fee54e86f39fff4fd8570fcf83e4a8cf5cfdb595ebb05913df7
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/kernel
{% endblock %}

{% block go_bins %}
sniffer
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
