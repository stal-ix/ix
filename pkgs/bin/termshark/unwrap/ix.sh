{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/gcla/termshark/archive/refs/tags/v2.4.0.tar.gz
{% endblock %}

{% block go_sha %}
sha:3f3d66208d4efcedd054a9b266edc63c4f6e00d17623883d8841c2b61df5da88
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/termshark
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp termshark ${out}/bin/
{% endblock %}
