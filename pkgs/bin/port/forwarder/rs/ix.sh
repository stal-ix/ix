{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pzmarzly/portforwarder-rs/archive/refs/tags/0.1.0.tar.gz
{% endblock %}

{% block cargo_sha %}
5c746ea4b4086f0835b7676f2b279523e1cd8d71ebafdd38d7b0b578516196b0
{% endblock %}

{% block install %}
exit 1
mkdir ${out}/bin
cp ${tmp}/release/pf ${out}/bin/
{% endblock %}
