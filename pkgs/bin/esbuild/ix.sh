{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.22.0.tar.gz
{% endblock %}

{% block go_sha %}
183790d376613dd718ea70c26fdb3a76c121c1b04a0de3af223aeee274b3db47
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
