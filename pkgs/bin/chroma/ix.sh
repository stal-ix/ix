{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.9.1.tar.gz
{% endblock %}

{% block go_sha %}
99d7f94f7c115ed9f69b4b521efcc5615318d2dce4d436a0435dce643513795f
{% endblock %}

{% block go_refine %}
find . -type l -delete
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
