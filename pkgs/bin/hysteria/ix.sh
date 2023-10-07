{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.0.4.tar.gz
{% endblock %}

{% block go_sha %}
254b43e870aac8fc19daf96a60f415fd5c3377e1c6b117d484f97b6a255f5de5
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
