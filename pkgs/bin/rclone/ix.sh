{% extends '//die/go/build.sh' %}

{% block pkg_name %}
rclone
{% endblock %}

{% block version %}
1.75.2
{% endblock %}

{% block go_url %}
https://github.com/rclone/rclone/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ff94b206b037d26c0f558adede25be3bd0cfcc57a184f15a12f97570094e925b
{% endblock %}

{% block go_bins %}
rclone
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
