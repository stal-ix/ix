{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.18.14.tar.gz
{% endblock %}

{% block go_sha %}
4a57d341454594995d884f73ea65729479ae66405f95f16dfe0e3984a206a322
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
