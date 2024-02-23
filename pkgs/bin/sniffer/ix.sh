{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/chenjiandongx/sniffer/archive/refs/tags/v0.6.1.tar.gz
{% endblock %}

{% block go_sha %}
9bb8d63301f4907618a41baf79ea244ee791ded5c2172fea39033cdb2f78d393
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
