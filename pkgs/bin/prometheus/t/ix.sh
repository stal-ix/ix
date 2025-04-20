{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.3.0
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
51b11112f4e44ff8c3909b9151c19e36ac8f346a2a254e16a50c8d12d6fd57a0
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
