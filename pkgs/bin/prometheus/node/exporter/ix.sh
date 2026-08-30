{% extends '//die/go/build.sh' %}

{% block pkg_name %}
node_exporter
{% endblock %}

{% block version %}
1.12.1
{% endblock %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fc968ed81018687cdc2db475b43e7b49d15a398184de3f3fbcf3f830218708b6
{% endblock %}

{% block go_bins %}
node_exporter
{% endblock %}


{% block go_tool %}
bin/go/lang/26
{% endblock %}
