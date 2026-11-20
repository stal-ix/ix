{% extends '//die/go/build.sh' %}

{% block pkg_name %}
node_exporter
{% endblock %}

{% block version %}
1.13.1
{% endblock %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
21c9f085cbf751c7056c943c1af3d8978fd6fe3261a1706e5719b0f49a12376c
{% endblock %}

{% block go_bins %}
node_exporter
{% endblock %}


{% block go_tool %}
bin/go/lang/27
{% endblock %}
