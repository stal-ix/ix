{% extends '//die/go/build.sh' %}

{% block version %}
0.6.1
{% endblock %}

{% block go_url %}
https://github.com/chenjiandongx/sniffer/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6f1ba90e975ba1fb3b512e3cdaabcaec36cac5696bfcda05d4af78ec6f79b467
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
