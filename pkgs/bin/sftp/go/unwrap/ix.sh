{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/drakkan/sftpgo/archive/refs/tags/v2.5.6.tar.gz
{% endblock %}

{% block go_sha %}
1a988fc8195017ee13178c1e3eff222bd2a64163ab1cac55397c02744d0c2a33
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sftpgo ${out}/bin
{% endblock %}
