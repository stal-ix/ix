{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.4.0.tar.gz
{% endblock %}

{% block go_sha %}
f8d94c72bd5facb8df625c2594301158492f8124fdfa9dc0d6309019a6aea32a
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
