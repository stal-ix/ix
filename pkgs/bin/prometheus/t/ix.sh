{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.5.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
91387d4238d36a45a22b9a0a8935912cdf7ca040d10f7ed98fa3e4d83dafeed3
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
