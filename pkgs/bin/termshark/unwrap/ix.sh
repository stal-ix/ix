{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/gcla/termshark/archive/refs/tags/v2.4.0.tar.gz
sha:949c71866fcd2f9ed71a754ea9e3d1bdc23dee85969dcdc78180f1d18ca8b087
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/termshark
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp termshark ${out}/bin/
{% endblock %}
