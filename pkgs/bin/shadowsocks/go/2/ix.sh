{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/shadowsocks/go-shadowsocks2/archive/refs/tags/v0.1.5.tar.gz
{% endblock %}

{% block go_sha %}
6748ce1af793e3f961251410c278a00d119da44918cbbcd28f1ed402c6691c6d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-shadowsocks2 ${out}/bin/
{% endblock %}
