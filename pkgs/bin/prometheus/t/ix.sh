{% extends '//die/go/build.sh' %}

{% block version %}
3.2.1
{% endblock %}

{% block go_url %}
https://github.com/prometheus/prometheus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a42c45c669d3f1984dd289f81df4dff1a35ea3d1d231f530c0c95f4068608f30
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
