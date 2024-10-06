{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.8.1.tar.gz
{% endblock %}

{% block go_sha %}
c4d6d7a722fc974ea0942f8349d45d392f8e97554b5726a6c53ed65de474907a
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
