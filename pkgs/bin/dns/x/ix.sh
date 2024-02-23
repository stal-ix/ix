{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v1.1.6.tar.gz
{% endblock %}

{% block go_sha %}
0a193a5bb9b6d36d10569ca8da121701710b4b5c858e5086233e40f9d4b7d5ec
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dnsx
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsx ${out}/bin/
{% endblock %}
