{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.2.0.tar.gz
{% endblock %}

{% block go_sha %}
3294657b92e8c601255aeabd881ecbd58560e35a3b858a088fa8a37ddf78189e
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/
{% endblock %}

{% block setup %}
export GOWORK=off
{% endblock %}
