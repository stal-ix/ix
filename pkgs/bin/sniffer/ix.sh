{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/chenjiandongx/sniffer/archive/refs/tags/v0.6.1.tar.gz
{% endblock %}

{% block go_sha %}
28ae63bbf927aa869a88ab7c0bd968ee6653e6ac913c19099fd58003b58bdb95
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
