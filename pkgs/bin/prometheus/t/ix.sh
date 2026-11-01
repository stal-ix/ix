{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.15.1
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
45085800556dac9af324f4384a6b0a5e3ae0c209e533f4ab893d329379e0d537
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
