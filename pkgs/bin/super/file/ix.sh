{% extends '//die/go/build.sh' %}

{% block pkg_name %}
superfile
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block go_url %}
https://github.com/yorukot/superfile/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
feef98539574338ac4da9d4c6a0b27a0781202d3e50a7b0e5b87af9c57f802e8
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_bins %}
superfile
{% endblock %}
