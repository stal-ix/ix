{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.13.0.tar.gz
{% endblock %}

{% block go_sha %}
fcd83f231fda82a70db6dba8e88b02ffa752a903c7d843aec395f5bd893649b4
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
