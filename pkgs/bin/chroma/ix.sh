{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.8.0.tar.gz
{% endblock %}

{% block go_sha %}
7bb6b183751b00ec8788a9f33449c2666287dc7637ce7e7a1af3fd8e60206bc8
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
