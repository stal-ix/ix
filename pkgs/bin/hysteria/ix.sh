{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.2.1.tar.gz
{% endblock %}

{% block go_sha %}
0c44205900e40eaa073bd8355765dd2abe1351d8aa08ff2cfa74b656490e1a02
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
