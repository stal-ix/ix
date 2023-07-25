{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/chenjiandongx/sniffer/archive/refs/tags/v0.6.1.tar.gz
{% endblock %}

{% block go_sha %}
sha:84bd40899bcc526baebec2c73b6cf99b721f764d0edcbd826d216bab9afa955d
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
