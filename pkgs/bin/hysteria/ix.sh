{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.5.2.tar.gz
{% endblock %}

{% block go_sha %}
6d042b1703ee379c586317a0c5b24982fb0e6bbd13cd5595597774ae9a737b85
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/hysteria
{% endblock %}

{% block setup_target_flags %}
export GOWORK=off
{% endblock %}
