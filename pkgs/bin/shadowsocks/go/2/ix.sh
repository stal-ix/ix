{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/shadowsocks/go-shadowsocks2/archive/refs/tags/v0.1.5.tar.gz
sha:7932c11d2315d263c09b5e7775ad2b9adf6cd3c132d59d98962c9598a1300acc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-shadowsocks2 ${out}/bin/
{% endblock %}
