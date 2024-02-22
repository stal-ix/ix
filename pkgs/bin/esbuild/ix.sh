{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.19.6.tar.gz
{% endblock %}

{% block go_sha %}
ee0501044ff46151a8ee67202b1be45f0f2f55bb6ae59035d41d7be734f4fa9d
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
