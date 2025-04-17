{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sniffer
{% endblock %}

{% block version %}
0.6.2
{% endblock %}

{% block go_url %}
https://github.com/chenjiandongx/sniffer/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1b6adf32e3ee8422d0e10c2b9acee673b756d905669f748a1e11e0333d9e57b8
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/kernel
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sniffer ${out}/bin/
{% endblock %}
