{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.18.14.tar.gz
{% endblock %}

{% block go_sha %}
500dd4133ba8b8997ac7b49f5e1bf31cc6b7e18c8695e66f243eb19648531b72
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
