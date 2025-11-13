{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.7.3
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0521fcc2a667228f0122646f46a9108e6b19b018fd9fd6b75c3806b522d43ade
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
