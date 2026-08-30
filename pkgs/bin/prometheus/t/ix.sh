{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.14.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
257d5a1ca9ea36184f74e5a156fc9cffc553d8070352c01d95326ce9b73dbcbe
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
