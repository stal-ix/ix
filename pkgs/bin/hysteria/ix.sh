{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/apernet/hysteria/archive/refs/tags/app/v2.6.0.tar.gz
{% endblock %}

{% block go_sha %}
059ddd324d122e5ddeb8a55b7575d0e221fbcb351fd510eff4117938201096b0
{% endblock %}

{% block go_tool %}
bin/go/lang/23
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
