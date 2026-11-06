{% extends '//die/go/build.sh' %}

{% block pkg_name %}
rclone
{% endblock %}

{% block version %}
1.76.0
{% endblock %}

{% block go_url %}
https://github.com/rclone/rclone/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a525f46734dfd9588404b37616ebb6e8ff633fcdf3105c0ead4b8105740c11a2
{% endblock %}

{% block go_bins %}
rclone
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
