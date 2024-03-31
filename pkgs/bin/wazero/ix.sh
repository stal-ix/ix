{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.7.0.tar.gz
{% endblock %}

{% block go_sha %}
85f0e55db6e8f6cfd075f0d5bed2010fceef7d9584b519d297acae7c3ee37caa
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
