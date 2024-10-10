{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.2.tar.gz
{% endblock %}

{% block cargo_sha %}
3600affcffce64a208da32963264dd87b80d1a26a57944b77759eea85cb80560
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
