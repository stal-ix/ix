{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/evanw/esbuild/archive/refs/tags/v0.21.3.tar.gz
{% endblock %}

{% block go_sha %}
d05bf6607d535c23dfeb55de83173c1b8f66d6926df284789f1a2decf2b604ea
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/esbuild
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp esbuild ${out}/bin/
{% endblock %}
