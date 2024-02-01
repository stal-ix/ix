{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.0.tar.gz
{% endblock %}

{% block cargo_sha %}
222e66d5f879bb5fbaa29af6afd1dc30ac9217864c4d850fb0f289770f144d18
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
