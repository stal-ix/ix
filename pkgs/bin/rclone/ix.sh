{% extends '//die/go/build.sh' %}

{% block pkg_name %}
rclone
{% endblock %}

{% block version %}
1.75.0
{% endblock %}

{% block go_url %}
https://github.com/rclone/rclone/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
feddfcb39fa13e9f55fd49183971a1ef6326aedaba0b0f9e115c7f877048fadd
{% endblock %}

{% block go_bins %}
rclone
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
