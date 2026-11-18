{% extends '//die/go/build.sh' %}

{% block pkg_name %}
node_exporter
{% endblock %}

{% block version %}
1.13.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/node_exporter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
aef5d97a7c7d7cab8113cefeb4bfce4036f8306f3e653658a96c720c60a55f72
{% endblock %}

{% block go_bins %}
node_exporter
{% endblock %}


{% block go_tool %}
bin/go/lang/27
{% endblock %}
