{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.8.0.tar.gz
{% endblock %}

{% block go_sha %}
38eea3b350354ffa0c2b446364da12cb12a8156568bb2c1f7cfc2d69fe82e322
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
