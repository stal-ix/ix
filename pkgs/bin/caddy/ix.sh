{% extends '//die/go/build.sh' %}

{% block pkg_name %}
caddy
{% endblock %}

{% block version %}
2.11.9
{% endblock %}

{% block go_url %}
https://github.com/caddyserver/caddy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f9bc890470074c463ca0154d69e25967aa403f5c0a9c5d5cacc0989dbdae6295
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/caddy
{% endblock %}

{% block go_bins %}
caddy
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
