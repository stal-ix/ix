{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.19.6.tar.gz
{% endblock %}

{% block go_sha %}
f9708c01e0f8893d8d0172d9d0e712a4ade0aae6cba3f844b707dafc323b74e3
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
