{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sh
{% endblock %}

{% block version %}
3.10.0
{% endblock %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7772d8d91d51efdea9a5f48d43b15c62253e5b750e9b8bbcb7e240019cd99424
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}
