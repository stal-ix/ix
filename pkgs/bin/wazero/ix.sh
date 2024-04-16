{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.7.1.tar.gz
{% endblock %}

{% block go_sha %}
a5d4a55863ee37fab632d65d3a3a85411d799fba8b6679b599131c8d1ef8296e
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
