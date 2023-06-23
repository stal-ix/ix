{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.2.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:c6668ba0210baaf9b75367989ca958d089ebc377e7752b9179799e73e5659f21
{% endblock %}

{% block go_sha %}
sha:c3be974344776dfcb4757b2a5edb22f6e990503954c78324d3e3a007c0b1d5e0
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
