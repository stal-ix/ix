{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.13.tar.gz
{% endblock %}

{% block cargo_sha %}
f29b284912b2f9aeb86417dfeec3df35563c2c59c8420bd5627ccb7273dc6c0d
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}
