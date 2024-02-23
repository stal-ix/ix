{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/shadowsocks/go-shadowsocks2/archive/refs/tags/v0.1.5.tar.gz
{% endblock %}

{% block go_sha %}
29359b3f5bcc0db2bf0b12197790f41814203cf95967184ccc832b802ef6e939
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-shadowsocks2 ${out}/bin/
{% endblock %}
