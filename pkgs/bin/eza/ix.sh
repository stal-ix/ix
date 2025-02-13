{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.21.tar.gz
{% endblock %}

{% block cargo_sha %}
20f8012a04e32106f4def1193ddc5ad721fbb7c92f411d6866d1345aa21b7a9b
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
