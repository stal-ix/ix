{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.7.0.tar.gz
{% endblock %}

{% block go_sha %}
30b719e301b23776c78ff19b2bc046d399c49f81f5ff6aa2e9f722839a89c8a5
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
