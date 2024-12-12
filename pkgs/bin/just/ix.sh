{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/1.38.0.tar.gz
{% endblock %}

{% block cargo_sha %}
1d7f1b13cc12b43510805523e2853d4b929f1d688217d859a6a63a19fc8bc904
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/just ${out}/bin/
{% endblock %}
