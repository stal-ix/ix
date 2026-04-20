{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
grafana-ui
{% endblock %}

{% block version %}
13.0.1
{% endblock %}

{% block fetch %}
https://dl.grafana.com/oss/release/grafana-{{self.version().strip()}}.linux-amd64.tar.gz
187ddc4badb69aecb7cd3fae2884add7ed21adde7124a6f8093b7b4033d722f2
{% endblock %}

{% block unpack %}
mkdir -p ${out}/share/grafana
cd ${out}/share/grafana
extract 1 ${src}/grafana*
# Drop bits we don't use at runtime: the prebuilt binary (we build our
# own via bin/grafana/d), docs, packaging scaffolding, runtime state.
rm -rf bin docs packaging data Dockerfile LICENSE NOTICE.md README.md VERSION
{% endblock %}

{% block env %}
export GRAFANA_HOMEPATH="${out}/share/grafana"
{% endblock %}
