{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v1.9.7.tar.gz
{% endblock %}

{% block go_sha %}
8b6edc409405f4eff079067139c38cff3f20e5d6f8d885c1ac33a3779045a18e
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sing-box ${out}/bin/
{% endblock %}
