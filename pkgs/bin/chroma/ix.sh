{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.9.1.tar.gz
{% endblock %}

{% block go_sha %}
0120ec221ae4bb6651fafc39afe1173e87638c1b1717e5111ca053999861e326
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
