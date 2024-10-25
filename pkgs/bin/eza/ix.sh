{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.5.tar.gz
{% endblock %}

{% block cargo_sha %}
ae148f2c746899cdcb3f4db492e2c7cd8e9efe0b0a1be1e952cb51066e2701f8
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
