{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.19.6.tar.gz
{% endblock %}

{% block go_sha %}
cb6b5c550b59ea517e2eae140c9f843c130e3e99dd3864426e79945c982747af
{% endblock %}

{% block go_refine %}
rm scripts/browser/esbuild.wasm.bagel
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
