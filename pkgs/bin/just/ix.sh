{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/1.39.0.tar.gz
{% endblock %}

{% block cargo_sha %}
ff6de991e1f5dd0f023d4b2c4a2dca55e6be7a27de66e8475e650e1218f9aefc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/just ${out}/bin/
{% endblock %}
