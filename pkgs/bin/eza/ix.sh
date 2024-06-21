{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.19.tar.gz
{% endblock %}

{% block cargo_sha %}
1929a6760bbd8e4f5a7efb52312a38a130b0e0507bad36f8cc4850bc1d4ba62f
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
