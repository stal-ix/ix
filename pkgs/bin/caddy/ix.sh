{% extends '//die/go/build.sh' %}

{% block pkg_name %}
caddy
{% endblock %}

{% block version %}
2.11.4
{% endblock %}

{% block go_url %}
https://github.com/caddyserver/caddy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/caddy
{% endblock %}

{% block go_bins %}
caddy
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
