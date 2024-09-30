{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v1.9.6.tar.gz
{% endblock %}

{% block go_sha %}
5ac7fa088f25c64cbc01b9802f0c7d9889f20af0f7daa3d94645334a5474199e
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sing-box ${out}/bin/
{% endblock %}
