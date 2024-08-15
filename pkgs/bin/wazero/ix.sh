{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.8.0.tar.gz
{% endblock %}

{% block go_sha %}
b1e2404b447f7431ab702a31382efd02cb3b1b4a2734b6fe4d7f775c928fdb97
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
