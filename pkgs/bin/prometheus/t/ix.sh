{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.7.2
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d53e1f48155c6a9cfe5142e7e4714e2d7c0bffa675b7035cc02834e68c421ea6
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
