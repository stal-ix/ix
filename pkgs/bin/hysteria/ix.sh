{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.5.1.tar.gz
{% endblock %}

{% block go_sha %}
68e97db761ef2c1c52ce49970548e14b5ea9087df56b515abc283364ab0bbb71
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
