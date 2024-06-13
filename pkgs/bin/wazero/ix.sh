{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.7.3.tar.gz
{% endblock %}

{% block go_sha %}
f902260a482d030f4f710668841cd0288805fa663f603512f34e0f52a1094108
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
