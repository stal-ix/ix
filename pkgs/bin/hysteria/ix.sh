{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.0.2.tar.gz
{% endblock %}

{% block go_sha %}
bd25b0e3654db75e20d3a6f573e6b0950aa6176be341f73c2f1c4f733d6117f7
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
