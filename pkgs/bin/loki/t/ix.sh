{% extends '//die/go/build.sh' %}

{% block pkg_name %}
loki
{% endblock %}

{% block version %}
3.7.10
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_url %}
https://github.com/grafana/loki/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
48646fccd676b03891b6cb78e0943c501f040055b889b1652b471bb73d2a76ab
{% endblock %}
