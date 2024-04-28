{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.4.2.tar.gz
{% endblock %}

{% block go_sha %}
51d3c324f14192253c7b022dc68795d9c422d9342d2281b0d23a3df268231aa4
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
