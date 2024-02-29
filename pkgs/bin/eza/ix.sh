{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.5.tar.gz
{% endblock %}

{% block cargo_sha %}
abbc45a8b0fd3f47616a0cb940b82553ee187623f7b91256bcff097c4cb00948
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
