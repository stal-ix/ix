{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.11.tar.gz
{% endblock %}

{% block go_sum %}
sha:1bb499edeaaadf1fe1791a49f96ab672c4e1add31ee125882ccd85a0fc8a4abe
{% endblock %}

{% block go_sha %}
sha:7215e1ab0e7e2f5ed626ab1842f01a826e95abfa6f7c1e1f13112a3ad418e412
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}
