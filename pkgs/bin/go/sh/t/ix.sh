{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sh
{% endblock %}

{% block version %}
3.11.0
{% endblock %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
35ed4bed1ba7fa1467e91e4f58e5ca058933ef4b5fa34ee99af78a7c1b04ca74
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
