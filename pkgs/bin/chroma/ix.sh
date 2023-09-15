{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.9.1.tar.gz
{% endblock %}

{% block go_sha %}
814eeacad9e95629b7dffedc9ce3cea848379989ab91553e57d8bc983704e548
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
