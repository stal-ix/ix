{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.18.14.tar.gz
{% endblock %}

{% block go_sha %}
5bcfe6569b9320a2aa8f27abff8249d8432f298744f8d8c4467f0542122a3b93
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
