{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/1.37.0.tar.gz
{% endblock %}

{% block cargo_sha %}
8e8818f424e1e1e4b75e62b522625e168da4f436cb3c00d6954b462e8141b8a6
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/just ${out}/bin/
{% endblock %}
