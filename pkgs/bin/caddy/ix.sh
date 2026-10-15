{% extends '//die/go/build.sh' %}

{% block pkg_name %}
caddy
{% endblock %}

{% block version %}
2.11.6
{% endblock %}

{% block go_url %}
https://github.com/caddyserver/caddy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0e98031a51417cc410a7feb3f4a5201245eb22bbc7610cf76dc06da87d9c6a2c
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/caddy
{% endblock %}

{% block go_bins %}
caddy
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
