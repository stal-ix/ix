{% extends '//die/go/build.sh' %}

{% block pkg_name %}
esbuild
{% endblock %}

{% block version %}
0.27.2
{% endblock %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
dce0781afde7f5db1e663f3ee98f1e53c428f09796edcf616718d1cfa3a83824
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block go_bins %}
esbuild
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
