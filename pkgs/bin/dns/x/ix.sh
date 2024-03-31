{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v1.1.6.tar.gz
{% endblock %}

{% block go_sha %}
feb0072a980a2fad7a7d5c1a7a3d1e463043b5d4e536ae1936d36a9ec845aab2
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dnsx
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsx ${out}/bin/
{% endblock %}
