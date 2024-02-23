{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v1.5.0.tar.gz
{% endblock %}

{% block go_sha %}
3ac1339709754487ff6836367abc2bf20a428c93197b0615e59747fb7f7586f7
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
