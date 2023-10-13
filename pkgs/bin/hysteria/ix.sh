{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.1.0.tar.gz
{% endblock %}

{% block go_sha %}
8b5cc855588ad9e3247fe9fb8473680baada4db0220985bf2e95b0f8455194b8
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
