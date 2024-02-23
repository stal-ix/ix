{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/gcla/termshark/archive/refs/tags/v2.4.0.tar.gz
{% endblock %}

{% block go_sha %}
976b38450c3c4c0070199e435448952d8a3d1131d67bae440edab9c3542646b1
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/termshark
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp termshark ${out}/bin/
{% endblock %}
