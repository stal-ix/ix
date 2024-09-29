{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xjasonlyu/tun2socks/archive/56786517dc3d4de051980a45dff71d33c924862b.zip
{% endblock %}

{% block go_sha %}
7d77500e5cd5c3c81011aee9536d76c6a2197fe345437cd6b680f21e3987800a
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block build %}
export GO111MODULE=on
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp tun2socks ${out}/bin/
{% endblock %}
