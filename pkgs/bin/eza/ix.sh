{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.19.3.tar.gz
{% endblock %}

{% block cargo_sha %}
1fee46ccc2d34b47d90a91ed499d1d1c1171de2ad7b0af9fb9d9e08cd13beca4
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
