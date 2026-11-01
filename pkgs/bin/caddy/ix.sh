{% extends '//die/go/build.sh' %}

{% block pkg_name %}
caddy
{% endblock %}

{% block version %}
2.11.7
{% endblock %}

{% block go_url %}
https://github.com/caddyserver/caddy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
10977d57208600536074791eaad8f30818999ba7edbac09a7759cf1015c27100
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
