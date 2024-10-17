{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v1.10.1.tar.gz
{% endblock %}

{% block go_sha %}
e4341c51262a38ab540a8aea35138d8ec12f559552b4cf378f716972e38607aa
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sing-box ${out}/bin/
{% endblock %}
