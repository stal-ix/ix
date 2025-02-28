{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.23.tar.gz
{% endblock %}

{% block cargo_sha %}
db0bd9992068ec2a0d4a59223f48d6b4ae5a0a19b39c147c04e5be229db40497
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
