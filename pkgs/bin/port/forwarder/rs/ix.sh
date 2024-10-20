{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pzmarzly/portforwarder-rs/archive/refs/tags/0.1.0.tar.gz
{% endblock %}

{% block cargo_sha %}
ab3a898c3fffb21cf7a56ae4ce3196c6f1fe9be0ea40d0aa751ea1de4a365b36
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/pf ${out}/bin/
{% endblock %}
