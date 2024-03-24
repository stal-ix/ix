{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.4.0.tar.gz
{% endblock %}

{% block go_sha %}
e168302d818f416af9f59ffd88f1f4ffa80d70f98e651f422eeaca0b5bd23364
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
