{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/1.35.0.tar.gz
{% endblock %}

{% block cargo_sha %}
8873cfcc43db665e9591a4fccdc200613625bc2245a4346ea0e5c9961eae3661
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/just ${out}/bin/
{% endblock %}



