{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.3.1.tar.gz
{% endblock %}

{% block go_sha %}
cb3b3df2400338a206bc1e32f62edb624184163e8c2adc1315edaf605db7b335
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
