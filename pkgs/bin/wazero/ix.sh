{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.8.2.tar.gz
{% endblock %}

{% block go_sha %}
c0e8cab286ed374339df10bff11495bb27194240ea406994c02583bc32a5f440
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
