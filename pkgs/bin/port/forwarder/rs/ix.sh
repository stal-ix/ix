{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pzmarzly/portforwarder-rs/archive/refs/tags/0.1.0.tar.gz
{% endblock %}

{% block cargo_sha %}
11dcdfd92a498765650765c1d19cff783606f9bba2f1c183e14b1889aefce65a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/pf ${out}/bin/
{% endblock %}
