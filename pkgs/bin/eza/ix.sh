{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.4.tar.gz
{% endblock %}

{% block cargo_sha %}
a62183cc17337ae491d3e364f6c566fb7148ac062d64cccd226b62f792b15758
{% endblock %}

{% block cargo_refine %}
find . -type l -delete
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
