{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.3.1
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9eb612911103132349194564db849bdac67058545372ac9079a5783a95383051
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
