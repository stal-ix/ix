{% extends '//die/go/build.sh' %}

{% block pkg_name %}
esbuild
{% endblock %}

{% block version %}
0.25.10
{% endblock %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
67b0ea206ec7be057adf11b589fe1edbc550322add23c35deb86a4715542b3a4
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
