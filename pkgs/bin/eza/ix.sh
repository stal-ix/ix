{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.22.tar.gz
{% endblock %}

{% block cargo_sha %}
ff7bdda8abc35ed3639f9b9f2810307c163a387fc250ac031ee3d87f967c1ab8
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}
