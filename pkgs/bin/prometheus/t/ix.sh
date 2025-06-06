{% extends '//die/go/build.sh' %}

{% block pkg_name %}
prometheus
{% endblock %}

{% block version %}
3.4.1
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
48fded3053886389cd63a7c8573f445fe69cb9d017b8d99fd6a5d3906897d842
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
