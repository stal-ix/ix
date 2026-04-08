{% extends '//die/go/build.sh' %}

{% block pkg_name %}
rclone
{% endblock %}

{% block version %}
1.73.4
{% endblock %}

{% block go_url %}
https://github.com/rclone/rclone/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
38aece4ac508d6a347e32e27b081af6e46e721b685077c35540369c683ab98d3
{% endblock %}

{% block go_bins %}
rclone
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
