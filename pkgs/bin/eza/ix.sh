{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.16.tar.gz
{% endblock %}

{% block cargo_sha %}
b426fee749011c7e87792c195a031fbc960fb32b65245a601196f39fab8593c0
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
