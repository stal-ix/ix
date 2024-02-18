{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v1.1.6.tar.gz
{% endblock %}

{% block go_sha %}
12556865ffcf6fb3964bd9dc5d860a67fef93c4323b480435adbd4a213b5cd5e
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dnsx
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsx ${out}/bin/
{% endblock %}
