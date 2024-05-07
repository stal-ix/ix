{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.21.0.tar.gz
{% endblock %}

{% block go_sha %}
2438f1e27871debffa2bfaf6637cb9e53902833fb30aef4f03dc1a02bdcf3031
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
