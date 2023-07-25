{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/chenjiandongx/sniffer/archive/refs/tags/v0.6.1.tar.gz
{% endblock %}

{% block go_sha %}
80c644f80306633a6b3e33c1cad5a7f810544d6ec1bc2630721615b737d4608e
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
