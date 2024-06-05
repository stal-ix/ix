{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.4.5.tar.gz
{% endblock %}

{% block go_sha %}
fc41ddc0b4397f78426fa41750c96dd772d19a5d74b7c571aca49763a1fab269
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
