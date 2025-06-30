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
397b064471141cbd25bc4dcbb5b824b42ad41b0aa09c889ae3e04622027aa3c5
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
