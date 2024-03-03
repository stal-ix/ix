{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/drakkan/sftpgo/archive/refs/tags/v2.5.6.tar.gz
{% endblock %}

{% block go_sha %}
34cffe0f78dcf5181fa16461969700b5c024545c4cd27b6ff6212d54c6c5f67a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sftpgo ${out}/bin
{% endblock %}
