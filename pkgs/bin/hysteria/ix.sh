{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.0.1.tar.gz
{% endblock %}

{% block go_sha %}
0405d7c3c772bd5249d8262ce253b9fecbfa8a96b1a5d92458ff3e8ca6848213
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
