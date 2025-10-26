{% extends '//die/go/build.sh' %}

{% block pkg_name %}
node_exporter
{% endblock %}

{% block version %}
1.10.2
{% endblock %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ed2b9258037b49dadf2f62a2d4f43e80e71c3195d8ab88ed04402eb898c013f9
{% endblock %}

{% block go_bins %}
node_exporter
{% endblock %}


{% block go_tool %}
bin/go/lang/24
{% endblock %}
