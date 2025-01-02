{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.15.tar.gz
{% endblock %}

{% block cargo_sha %}
789aa3dc7de7f23df729dd540351dc3d5605d4890c6e3cfb0014234f89ae55f3
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
