{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.11.tar.gz
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
