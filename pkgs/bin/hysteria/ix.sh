{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.2.3.tar.gz
{% endblock %}

{% block go_sha %}
cc19afa105529185719e1a48a5d5abf0a84ade1e4d2afefe5038d764b7a4ad75
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
