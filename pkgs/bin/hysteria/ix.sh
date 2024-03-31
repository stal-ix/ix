{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.4.0.tar.gz
{% endblock %}

{% block go_sha %}
61cb10d9daa81224b21003b33d85546efa720edb6bf18e9c0baa0e8cfde471a0
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

{% block go_version %}
v3
{% endblock %}
