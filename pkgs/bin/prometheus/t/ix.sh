{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.4.2
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7756d1877e0f60c1b0600d9475ded4876da333a8281c29fad77e5f5dc8e1576e
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
