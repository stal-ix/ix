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
98b6357bbd57a07695e31ab3e7531e62c2804869c4b199b549cba51264af18eb
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
