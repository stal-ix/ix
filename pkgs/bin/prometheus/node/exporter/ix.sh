{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v1.7.0.tar.gz
{% endblock %}

{% block go_sha %}
67b07335221810969fffdc83df9f548471e32d81d111ff5c25543c9ff0d4b8e3
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp node_exporter ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
