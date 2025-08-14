{% extends '//die/go/build.sh' %}

{% block pkg_name %}
esbuild
{% endblock %}

{% block version %}
0.25.9
{% endblock %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
bdb91b56d637a291d0e94f6d94f31c9bad078654541fba95b27bf2efce1bbf2a
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block go_bins %}
esbuild
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
