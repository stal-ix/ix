{% extends '//die/go/build.sh' %}

{% block pkg_name %}
esbuild
{% endblock %}

{% block version %}
0.25.6
{% endblock %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0abdacde45a8ad427e2df96798e4a20b352c57ad7a07f183adccad0697eecb24
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
