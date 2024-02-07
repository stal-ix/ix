{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gcla/termshark/archive/refs/tags/v2.4.0.tar.gz
{% endblock %}

{% block go_sha %}
c3c05d9c6ef7c48fbff0bf7c5170c2d5c7bfd6929f94693ed672694978972549
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/termshark
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp termshark ${out}/bin/
{% endblock %}
