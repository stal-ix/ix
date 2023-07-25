{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/shadowsocks/go-shadowsocks2/archive/refs/tags/v0.1.5.tar.gz
{% endblock %}

{% block go_sha %}
f5444c003e1e75476131d03cf3fe9b3a9bec9dbd8934fc687a2daccc44dfd37c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-shadowsocks2 ${out}/bin/
{% endblock %}
