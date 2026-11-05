{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.16.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
08d53ff236d5a266a9bab4538c95cc9c67024f3998ad5f77253fb09bb828e76a
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
