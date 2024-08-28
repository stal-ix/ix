{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.19.1.tar.gz
{% endblock %}

{% block cargo_sha %}
7c2cf6d3144815c20daf78812f00640757f22e8870fe674df4cdf78a5bd4ce7a
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
