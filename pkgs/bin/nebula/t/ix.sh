{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nebula
{% endblock %}

{% block version %}
1.9.5
{% endblock %}

{% block go_url %}
https://github.com/slackhq/nebula/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f31f76493db5c0eee508099de4d15f0384c8e1891e1659aac453097a073b6da9
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
