{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.19.2.tar.gz
{% endblock %}

{% block cargo_sha %}
82bdd54f6bafbfa6184d1029745b97dbd6099bfd06df95b63e14eb96ecf19cc4
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
