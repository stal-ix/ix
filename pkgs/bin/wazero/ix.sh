{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.5.0.tar.gz
{% endblock %}

{% block go_sha %}
0baec9dbd2046f2ec147be10c6a571fb905721f1f9c64c7d5bd6f7a58ede2760
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
