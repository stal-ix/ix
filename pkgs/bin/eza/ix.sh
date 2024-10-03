{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.1.tar.gz
{% endblock %}

{% block cargo_sha %}
d1d7db8ffb1f67c023faac15c4e592ec1dda9363fb32c2f6101b3c123cef9de5
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
