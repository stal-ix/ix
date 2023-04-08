{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.11.tar.gz
{% endblock %}

{% block go_sum %}
sha:1bb499edeaaadf1fe1791a49f96ab672c4e1add31ee125882ccd85a0fc8a4abe
{% endblock %}

{% block go_sha %}
sha:59843c7ab8b723062598c6a146ede0ace3c732347990d9284ddc807d17571dcd
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}
