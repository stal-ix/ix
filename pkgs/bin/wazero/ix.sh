{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.3.1.tar.gz
{% endblock %}

{% block go_sha %}
af74e96af6e0c6ab34ad3e37e52251b59b1e24c59edf6667ca03fdb97f8a8079
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
