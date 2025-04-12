{% extends '//die/go/build.sh' %}

{% block version %}
1.7.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
bd32277c8a742bb73a9e4be101439da7ecd3101887e3e378b16c6c48f0cbdd37
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp node_exporter ${out}/bin/
{% endblock %}
