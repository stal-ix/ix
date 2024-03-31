{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/shadowsocks/go-shadowsocks2/archive/refs/tags/v0.1.5.tar.gz
{% endblock %}

{% block go_sha %}
56c9d6106a7ca3902c28d713562ff34c4ad08862931ca3169295006e8204b04b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-shadowsocks2 ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
