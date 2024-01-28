{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.17.3.tar.gz
{% endblock %}

{% block cargo_sha %}
3425f2e342f26cf91b30af88b7f250d3b749cfe63ff4636c08c49181819ef0b5
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
