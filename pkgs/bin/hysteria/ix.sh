{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.0.0.tar.gz
{% endblock %}

{% block go_sha %}
dd5fc10c889339b0ed941abb22a7c7101be49809d8278a7b4e7e1bb884603ab6
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
