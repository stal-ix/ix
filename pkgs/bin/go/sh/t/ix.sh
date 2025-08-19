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
b455663d65dace341c233c11b68c0d9b5dbdcf541b8754f45642b01dd6af762c
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
