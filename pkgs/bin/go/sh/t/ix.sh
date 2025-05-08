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
8fb5aff1ba62d943638d702005d16af0e808db49d8b812a9434607ce236399bb
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
